from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
import hashlib

app = Flask(__name__)
CORS(app)  # 允许跨域请求
#这个app就是前端后端连接的实例

# 数据库配置
db_config = {
    'host': 'yourLocalhost',
    'user': 'yourUser',
    'password': 'yourPassword',
    'database': 'yourDatabase'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/login', methods=['POST'])
def login():
    #获取到前端发送来的手机号和密码数据
    data = request.get_json()
    phone = data.get('phone')
    password = data.get('password')

    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        #执行用户查询操作
        query_str = "select * from user where phone = " + phone
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchone()

        #结果验证
        if result and result['password'] == password:
            return jsonify({
                'uid':result['uid'],
                'success':True
            })
        else :
            return jsonify({
                'uid': result['uid'],
                'success': False
            })


    except mysql.connector.Error as err:
        print(f"数据库错误: {err}")
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/show_roles', methods=['POST'])
def show_roles():
    # 获取到前端发送来的玩家uid
    data = request.get_json()
    uid = data.get('uid')
    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        #执行用户查询操作
        query_str = "select * from roles where owner_uid = " + uid
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchall()

        return jsonify({
            'success': True,
            'data': result
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()

@app.route('/Light_cones_get', methods=['POST'])
def Light_cones_get():
    # 获取到前端发送来的玩家uid
    data = request.get_json()
    uid = data.get('uid')
    try:
        # 尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        # 执行用户查询操作
        query_str = "select * from light_cones where owner_id = " + uid
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchall()

        return jsonify({
            'success': True,
            'result': result
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/Light_cones_update', methods=['POST'])
def Light_cones_update():
    # 获取前端数据
    data = request.get_json()
    uid = data.get('uid')
    user = data.get('user')

    try:
        connect = get_db_connection()
        cursor = connect.cursor()
        connect.autocommit = False  # 关闭自动提交

        # 更新light_cones表
        update_light_cones = f"""
            UPDATE light_cones 
            SET user = '无' 
            WHERE owner_id = {uid} 
            AND user = '{user}'
        """
        cursor.execute(update_light_cones)
        lc_affected = cursor.rowcount

        # 更新roles表
        update_roles = f"""
            UPDATE roles 
            SET Light_cone = NULL 
            WHERE owner_uid = {uid} 
            AND role_name = '{user}'
        """
        cursor.execute(update_roles)
        role_affected = cursor.rowcount

        # 提交事务
        connect.commit()

        return jsonify({
            'success': True,
            'message': f'更新成功，影响光锥表{lc_affected}行，角色表{role_affected}行'
        })

    except mysql.connector.Error as err:
        connect.rollback()  # 回滚事务
        return jsonify({'success': False, 'message': f'数据库错误: {err.msg}'}), 500
    except Exception as e:
        connect.rollback()
        return jsonify({'success': False, 'message': f'系统错误: {str(e)}'}), 500
    finally:
        if 'cursor' in locals(): cursor.close()
        if 'connect' in locals(): connect.close()

@app.route('/Light_cones_equip', methods=['POST'])
def Light_cones_equip():
    data = request.get_json()
    uid = data.get('uid')
    user = data.get('user')
    name = data.get('name')

    try:
        connect = get_db_connection()
        cursor = connect.cursor()

        # 调用存储过程执行安全装备操作
        cursor.callproc("EquipLightCone", (uid, name, user))
        connect.commit()

        return jsonify({
            'success': True,
            'message': '光锥装备成功'
        })

    except mysql.connector.Error as err:
        # 提取存储过程的定制错误消息
        error_message = f'数据库错误: {err.msg}'

        # 解析存储过程的自定义错误
        if '光锥已被其他角色装备' in err.msg:
            error_message = '装备失败：该光锥已被其他角色装备'
        elif '角色已装备其他光锥' in err.msg:
            error_message = '装备失败：该角色已装备其他光锥'

        return jsonify({'success': False, 'message': error_message}), 500
    except Exception as e:
        return jsonify({'success': False, 'message': f'系统错误: {str(e)}'}), 500
    finally:
        if 'cursor' in locals(): cursor.close()
        if 'connect' in locals(): connect.close()

@app.route('/Light_cones_delete', methods=['POST'])
def Light_cones_delete():
    data = request.get_json()
    uid = data.get('uid')
    name = data.get('name')

    try:
        connect = get_db_connection()
        cursor = connect.cursor()
        connect.autocommit = False

        # 参数化查询删除操作
        delete_sql = """
            DELETE FROM light_cones 
            WHERE owner_id = %s 
            AND name = %s
        """
        cursor.execute(delete_sql, (uid, name))
        affected_rows = cursor.rowcount

        # 提交事务
        connect.commit()

        return jsonify({
            'success': True,
            'message': f'成功删除{affected_rows}行数据'
        })

    except mysql.connector.Error as err:
        connect.rollback()
        return jsonify({'success': False, 'message': f'数据库错误: {err.msg}'}), 500
    except Exception as e:
        connect.rollback()
        return jsonify({'success': False, 'message': f'系统错误: {str(e)}'}), 500
    finally:
        if 'cursor' in locals(): cursor.close()
        if 'connect' in locals(): connect.close()
        
@app.route('/relics_get', methods=['POST'])
def relics_get():
    # 获取到前端发送来的玩家uid
    data = request.get_json()
    uid = data.get('uid')
    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        #执行用户查询操作
        query_str = "select * from my_relics where owner_uid = " + uid
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchall()

        return jsonify({
            'success': True,
            'result': result
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/all_relics_get', methods=['POST'])
def all_relics_get():
    # 获取到前端发送来的玩家uid
    data = request.get_json()
    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        #执行用户查询操作
        query_str = "SELECT * FROM all_relics"
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchall()

        return jsonify({
            'success': True,
            'result': result
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/Insert_new_relic', methods=['POST'])
def Insert_new_relic():
    # 获取到前端发送来的玩家uid
    data = request.get_json()
    owner_uid = int(data.get('owner_uid'))
    name = data.get('name')
    id = data.get('id')
    body = data.get('body')
    main_entry = data.get('main_entry')
    secondary_entry1 = data.get('secondary_entry1')
    secondary_entry2 = data.get('secondary_entry2')
    secondary_entry3 = data.get('secondary_entry3')
    secondary_entry4 = data.get('secondary_entry4')
    package = data.get('package')
    user = ""
    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor()

        insert_query = """
                INSERT INTO my_relics (
                    owner_uid, 
                    name, 
                    id,
                    body, 
                    main_entry, 
                    secondary_entry1, 
                    secondary_entry2, 
                    secondary_entry3, 
                    secondary_entry4, 
                    package
                ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """
        values = (
            owner_uid,
            name,
            id,
            body,
            main_entry,
            secondary_entry1,
            secondary_entry2,
            secondary_entry3,
            secondary_entry4,
            package
        )
        print(values)
        cursor.execute(insert_query, values)
        connect.commit()

        return jsonify({
            'success': True,
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/Light_cones_story_get', methods=['POST'])
def Light_cones_story_get():
    try:
        #尝试建立连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)

        #执行用户查询操作
        query_str = "SELECT name,story FROM all_light_cones"
        print(query_str)
        cursor.execute(query_str)
        result = cursor.fetchall()

        return jsonify({
            'success': True,
            'result': result
        })

    except mysql.connector.Error as err:
        return jsonify({'success': False, 'message': '数据库错误'}), 500
    finally:
        cursor.close()
        connect.close()


@app.route('/get_user_light_cones', methods=['POST'])
def get_user_light_cones():
    data = request.get_json()
    uid = int(data.get('uid'))

    try:
        # 获取数据库连接
        connect = get_db_connection()
        cursor = connect.cursor(dictionary=True)  # 使用字典格式返回结果

        # 查询视图数据
        query = """
            SELECT 
                name,
                star_rating,
                Paths,
                user,
                light_cone_story
            FROM light_cones_view
            WHERE owner_id = %s
        """
        cursor.execute(query, (int(uid),))

        light_cones = cursor.fetchall()

        return jsonify({
            "success": True,
            "result": light_cones,
        })

    except mysql.connector.Error as err:
        # 数据库错误处理
        return jsonify({
            "success": False,
            "message": f"数据库错误: {err.msg}"
        }), 500

    except Exception as e:
        # 其他异常处理
        return jsonify({
            "success": False,
            "message": f"系统错误: {str(e)}"
        }), 500

    finally:
        # 清理资源
        if 'cursor' in locals():
            cursor.close()
        if 'connect' in locals() and connect.is_connected():
            connect.close()


if __name__ == '__main__':
    app.run(host='localhost', port=5000, debug=True)





