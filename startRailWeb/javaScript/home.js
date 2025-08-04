
var navigate_role
var navigation_Relic
var navigation_Light_Cones

//需要一个全局数组来记录所有角色的信息
var roles
var uid
var current_role
var current_Light_cone

export function init(){
    initElement();
    initEvent();
}

function initElement(){
    current_Light_cone = localStorage.getItem('current_Light_cone');
    current_role = localStorage.getItem('current_role');
    uid = localStorage.getItem('currentUID');
    navigate_role = document.getElementById("navigation_role");
    navigation_Relic = document.getElementById("navigation_Relic");
    navigation_Light_Cones = document.getElementById("navigation_Light_Cones"); 
}

function initEvent(){
    show_roles();
    navigate_role.onclick = function(){
        window.location.href = "./home.html";
    }
    navigation_Relic.onclick = function(){
        window.location.href = "./Relic.html";
    }
    navigation_Light_Cones.onclick = function(){
        window.location.href = "./Light_cone_house.html";
    }
}

//只要在home，就会刷新所有角色的列表
function show_roles(){
    fetch('http://localhost:5000/show_roles',{
        method:'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'uid': uid
        })
    })
    .then(response => {
        if (!response.ok) return response.json().then(err => Promise.reject(err))
        return response.json()
    })
    .then(data => {
        if(data.success){
            console.log("角色信息获取成功");
            roles = data.data;
            localStorage.setItem('roles_imformation',JSON.stringify(roles));
            //接下要使用这个字典数组来改变html界面
            // 获取容器元素
            var container = document.getElementById('show_roles');

            // 清空原有内容
            container.innerHTML = ''; 

            // 遍历角色数据创建元素
            var sum = 0; //这个变量用于记录已经添加了几个了
            roles.forEach(role => {
                sum++;
                // 创建图片元素
                var img = document.createElement('img');
                var role_name = role['role_name'];
                var img_url = "./picture/roles/" + role_name + ".png";
                img.src = img_url;
                img.alt = role_name;

                container.appendChild(img);
                
                if(sum % 3 == 0){
                    //加名字
                    var role_name1 = roles[sum-3]['role_name'];
                    var role_name2 = roles[sum-2]['role_name'];
                    var role_name3 = roles[sum-1]['role_name'];

                    var p1 = document.createElement('p');
                    var p2 = document.createElement('p');
                    var p3 = document.createElement('p');

                    p1.textContent = role_name1;
                    p2.textContent = role_name2;
                    p3.textContent = role_name3;

                    container.appendChild(p1);
                    container.appendChild(p2);
                    container.appendChild(p3);
                }
            });
            //末尾有1-2名角色还没有名字，这里要加上
            var left = sum % 3;
            var pad = 3 - left;
            //先填充空白
            for(var i = 0;i<pad;i++){
                var p = document.createElement('p');
                p.textContent = "";
                container.appendChild(p);
            }
            //然后再填充名字
            for(var i = 0;i<left;i++){
                var role_name = roles[sum - left]['role_name'];
                var p = document.createElement('p');
                p.textContent = role_name;
                container.appendChild(p);
            }
        }
        else {
            console.log("角色信息获取失败");
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert(error.message || "发生错误");
    });
}