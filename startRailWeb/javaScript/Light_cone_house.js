var uid
var Light_cone_data
var container
var alt
var button_container

var light_cone_story

//user记录了当前展示的光锥的佩戴者的名字
var user
var roles
var current_role
var current_role_path

var choose_Light_cone
//记录了本页面是否要显示的是选择光锥界面
//每次使用完毕这变量后都要将其更新为false

var navigate_role
var navigation_Relic
var navigation_Light_Cones

window.onload = function () {
    initElement();
    initEvent();
}

function initElement() {
    button_container = document.getElementById('show_button');
    container = document.getElementById('show_Light_Cones');
    uid = localStorage.getItem("currentUID");
    roles = JSON.parse(localStorage.getItem('roles_imformation'));
    choose_Light_cone = localStorage.getItem('choose_Light_cone');

    navigate_role = document.getElementById("all_roles");
    navigation_Relic = document.getElementById("my_Relic");
    navigation_Light_Cones = document.getElementById("all_Light_Cones");

    light_cone_story = new Map();
}

function initEvent() {
    navigate_role.onclick = function () {
        window.location.href = "./home.html";
    }
    navigation_Relic.onclick = function () {
        window.location.href = "./Relic.html";
    }
    navigation_Light_Cones.onclick = function () {
        window.location.href = "./Light_cone_house.html";
    }

    container.addEventListener('click', function (event) {
        if (event.target.tagName === 'IMG') {
            alt = event.target.alt;
            show(alt);
        }
    }
    )
    console.log("这是Light_cone_house.js");
    login();
    button_container.addEventListener('click', function (event) {
        if (event.target.id == "remove_button") {
            if (user == "无") {
                alert("该光锥没有装备者，无法卸下");
                return;
            }
            // 显示确认弹窗
            const isConfirm = confirm("你确定要卸下吗？");
            // 如果用户点击取消
            if (!isConfirm) {
                return; // 中止函数执行
            }
            // 用户点击确定后执行
            console.log("你执行了卸下操作");
            remove_funct();
        }
        if (event.target.id == "equip_button") {
            if (user != "无") {
                alert("该光锥已有装备者，无法装备");
                return;
            }
            // 显示确认弹窗
            const isConfirm = confirm("你确定要装备该光锥吗？");
            // 如果用户点击取消
            if (!isConfirm) {
                return; // 中止函数执行
            }
            // 用户点击确定后执行
            console.log("你执行了装备操作");
            equip_funct();
        }
        if (event.target.id == "delete_button") {
            // 显示确认弹窗
            const isConfirm = confirm("你确定要删除该光锥吗？此操作不可撤回！");
            // 如果用户点击取消
            if (!isConfirm) {
                return; // 中止函数执行
            }
            // 用户点击确定后执行
            console.log("你执行了删除操作");
            delete_funct();
        }

    });


}
function login() {
    fetch('http://localhost:5000/get_user_light_cones', {
        method: 'POST',
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
            if (data.success) {
                console.log(data.result);
                //如果current_role有值，找一下这个角色的命途，以供本页面是选择功能的时候使用
                current_role = localStorage.getItem("current_role");
                if (choose_Light_cone && current_role) {
                    for (var i = 0; i < roles.length; i++) {
                        if (roles[i]['role_name'] == current_role) {
                            current_role_path = roles[i]['path'];
                            break;
                        }
                    }
                }
                Light_cone_data = data.result;
                localStorage.setItem("Light_cones_data", JSON.stringify(Light_cone_data));
                var sum = 0;
                var had_roles = [];
                container.innerHTML = '';
                Light_cone_data.forEach(element => {
                    //如果是选择模式，那只能打印符合current_role的命途的光锥，其他的不能显示
                    if (choose_Light_cone) {
                        if (element['Paths'] != current_role_path) {
                            return;
                        }
                    }
                    //在这里要把所有的光锥都打印出来
                    sum++;
                    // 创建图片元素
                    var img = document.createElement('img');
                    var Light_cone_name = element['name'];
                    var img_url = "./picture/Light_cones/" + Light_cone_name + "2.png";
                    img.src = img_url;
                    img.alt = Light_cone_name;
                    had_roles.push(Light_cone_name);

                    container.appendChild(img);
                    //加名字
                    if (sum % 3 == 0) {
                        for (var i = 0; i < 3; i++) {
                            var p = document.createElement('p');
                            p.textContent = had_roles[i]
                            container.appendChild(p);
                        }
                        sum = 0;
                        had_roles = [];
                    }
                });
                //末尾有1-2名角色还没有名字，这里要加上
                var pad = 3 - sum;
                if (pad != 3) {
                    //先填充空白
                    for (var i = 0; i < pad; i++) {
                        var p = document.createElement('p');
                        p.textContent = "";
                        container.appendChild(p);
                    }
                    //然后再填充名字
                    for (var i = 0; i < sum; i++) {
                        var Light_cone_name = had_roles[i];
                        var p = document.createElement('p');
                        p.textContent = Light_cone_name;
                        container.appendChild(p);
                    }
                    had_roles = [];
                }
            }
            else {
                alert("光锥库查询失败");
            }

        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生错误");
        });

    fetch('http://localhost:5000/Light_cones_story_get', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
        })
    })
        .then(response => {
            if (!response.ok) return response.json().then(err => Promise.reject(err))
            return response.json()
        })
        .then(data => {
            if (data.success) {
                var result = data.result;
                for (var i = 0; i < result.length; i++) {
                    light_cone_story.set(result[i]['name'], result[i]['story']);
                }
            }
            else {
                alert("光锥库查询失败");
            }

        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生错误");
        });

}

function show(alt) {
    //先遍历找到要输出信息的光锥
    Light_cone_data.forEach(element => {
        if (element['name'] == alt) {
            console.log("你点击的是：", alt);
            var path = element['Paths'];
            var star = element['star_rating'];
            user = element['user'];

            //添加内容
            var container_1 = document.getElementById("show_path") //添加命途图标的容器
            var container_2 = document.getElementById('show_star_block'); //添加星级图片的容器
            var container_3 = document.getElementById('show_user'); //添加装备者信息的容器
            var container_4 = document.getElementById('show_button'); //添加卸下，删除 或者装备按钮的容器
            var container_5 = document.getElementById('show_information'); //添加光锥介绍信息的容器

            container_1.innerHTML = '';
            container_2.innerHTML = '';
            container_3.innerHTML = '';
            container_4.innerHTML = '';
            container_5.innerHTML = '';
            //添加命途图标
            var img = document.createElement('img');
            img.class = "star_img";
            img.src = "./picture/Paths/" + path + ".png";
            img.alt = path
            container_1.appendChild(img);

            //展示星级
            for (var i = 0; i < star; i++) {
                // 创建单个星星容器
                const starWrapper = document.createElement('div');
                starWrapper.className = 'show_star';

                // 创建图片元素
                const starImg = document.createElement('img');
                starImg.className = 'star_img';
                starImg.src = './picture/星.png';
                starImg.alt = '评分星星';

                // 组合元素
                starWrapper.appendChild(starImg);
                container_2.appendChild(starWrapper);
            }

            //展示装备者
            var str = "装备者：" + user;
            var p = document.createElement('p');
            p.textContent = str;
            container_3.appendChild(p);

            //展示按钮
            //这里要分情况讨论
            if (choose_Light_cone) {
                container_4.innerHTML = `
                <div id="equip_button">装备</div>
                `;
            }
            else {
                container_4.innerHTML = `
                <div id="remove_button">卸下</div>
                <div style="width:30%;height:100%"></div>
                <div id="delete_button">删除</div>
                `;
            }


            //展示光锥信息
            container_5.style.display = "block";
            console.log(light_cone_story.get(alt));
            container_5.innerHTML = `
                <strong>光锥故事:</strong>
                <span style="white-space: pre-wrap;">${light_cone_story.get(alt)}</span>
            `;
        }
    });
}

function remove_funct() {
    fetch('http://localhost:5000/Light_cones_update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'user': user,  // 确保user变量已正确定义
            'uid': uid  // 直接使用存储的UID
        })
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(new Error(err.message || "请求失败")));
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                var container = document.getElementById('show_user');
                container.innerHTML = ""
                var p = document.createElement('p');
                p.textContent = "装备者：无";
                container.appendChild(p);

                //另外，我们必须改变存下来的roles信息和
                //改变完之后要通过localStorage传递给其他js文件
                updata_roles();
                updata_Light_cones_data();
                user = "无";
                alert('操作成功!');
            } else {
                throw new Error(data.message || "操作未成功完成");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生未知错误");
        });

}

function equip_funct() {
    fetch('http://localhost:5000/Light_cones_equip', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'name': alt,  // 光锥名字
            'user': current_role, //当前要装备该光锥的角色
            'uid': uid  // 直接使用存储的UID
        })
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(new Error(err.message || "请求失败")));
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                var container = document.getElementById('show_user');
                container.innerHTML = ""
                var p = document.createElement('p');
                p.textContent = "装备者：" + current_role;
                container.appendChild(p);

                //另外，我们必须改变存下来的roles信息，因为角色佩戴的光锥已经改变
                //改变完之后要通过localStorage传递给其他js文件
                updata_roles();
                updata_Light_cones_data();
                alert('操作成功!');
            } else {
                throw new Error(data.message || "操作未成功完成");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生未知错误");
        });
}

function delete_funct() {
    fetch('http://localhost:5000/Light_cones_delete', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'name': alt,
            'uid': uid  // 直接使用存储的uid
        })
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(new Error(err.message || "请求失败")));
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                var container = document.getElementById('show_attributes_of_Light_Cones');
                container.innerHTML = ""
                var p = document.createElement('p');
                p.textContent = "该光锥已被删除";
                container.appendChild(p);

                //另外，我们必须改变存下来的roles信息，因为角色佩戴的光锥已经改变
                //改变完之后要通过localStorage传递给其他js文件
                updata_roles();
                updata_Light_cones_data();
                //同时要重新加载一下光锥显示页面，意在去掉删除的那张光锥
                login();
                alert('操作成功!');
            } else {
                throw new Error(data.message || "操作未成功完成");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生未知错误");
        });

}

function updata_roles() {
    fetch('http://localhost:5000/show_roles', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'uid': uid
        })
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(new Error(err.message || "请求失败")));
            }
            return response.json();
        })
        .then(data => {
            roles = data.data;
            localStorage.setItem('roles_imformation', JSON.stringify(roles));
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生未知错误");
        });
}

function updata_Light_cones_data() {
    fetch('http://localhost:5000/Light_cones_get', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'uid': uid
        })
    })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(new Error(err.message || "请求失败")));
            }
            return response.json();
        })
        .then(data => {
            Light_cone_data = data.result;
            localStorage.setItem("Light_cones_data", JSON.stringify(Light_cone_data));
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生未知错误");
        });

}

