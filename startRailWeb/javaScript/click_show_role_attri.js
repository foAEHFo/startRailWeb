
var roles
var container_Listener1
var container_Listener2
var alt

//这个全局变量要记录当前展示的是哪个角色的信息
var current_role
var current_Light_cone
var choose_Light_cone //是否激活选择光锥功能

export function init(){
    initElement();
    initEvent();
}

function initElement(){
    localStorage.setItem("choose_Light_cone",'');
    current_role = localStorage.getItem('current_role');
    current_Light_cone = localStorage.getItem('current_Light_cone');
    container_Listener1 = document.getElementById('show_roles');
    container_Listener2 = document.getElementById('show_role_Light_Cones');
}

function initEvent(){
    container_Listener1.addEventListener('click', function(event) {
        console.log("this click on picture");
        if (event.target.tagName === 'IMG') {
            alt = event.target.alt;
            show(alt);
        }
    }
    )
    container_Listener2.addEventListener('click', function(event){
        //console.log("光锥验视跳转检测",current_role,current_Light_cone);
        if (event.target.tagName == 'IMG' && current_Light_cone){

            choose_Light_cone = '';
            localStorage.setItem("choose_Light_cone",choose_Light_cone);
            window.location.href = 'Inspection.html';
        }
        else if(event.target.tagName == 'IMG' && !current_Light_cone){
            choose_Light_cone = 1;
            localStorage.setItem("choose_Light_cone",choose_Light_cone);
            window.location.href = 'Light_cone_house.html';
        }
    });
    if(current_role){
        console.log("记录数据显示");
        show("");
    }
}

function show(alt){
            roles = JSON.parse(localStorage.getItem('roles_imformation'));
            console.log("home页面角色属性展示函数执行");
            var judge;
            if(alt){
                judge = alt;
            }
            else {
                judge = current_role;
            }
            var level;
            var HP;
            var ATK;
            var DEF;
            var SPD;
            var Crit_Rate;
            var Crit_Damage;
            for (let i = 0; i < roles.length; i++) {
                const role = roles[i];
                if (role['role_name'] == judge) {

                    current_role = role['role_name'];
                    localStorage.setItem('current_role',current_role);
                    current_Light_cone = role['Light_cone'];
                    localStorage.setItem('current_Light_cone',current_Light_cone);


                    console.log("已找到所点角色",localStorage.getItem("current_role"));
                    level = role['level'];
                    HP = role['HP'];
                    ATK = role['ATK'];
                    DEF = role['DEF'];
                    SPD = role['SPD'];
                    Crit_Rate = role['Crit_Rate'];
                    Crit_Damage = role['Crit_Damage'];
    
                    break;
                }
            }
            //现在把这些属性写入show_attributes中
            var container = document.getElementById('show_attributes');
            container.innerHTML = ''; 

            var p1 = document.createElement('p');
            var p2 = document.createElement('p');
            var p3 = document.createElement('p');
            var p4 = document.createElement('p');
            var p5 = document.createElement('p');
            var p6 = document.createElement('p');
            var p7 = document.createElement('p');
            var p8 = document.createElement('p');

            p1.textContent = "      等级：" + level + "/80";
            p2.textContent = "      生命值：" + HP;
            p3.textContent = "      攻击力：" + ATK;
            p4.textContent = "      防御力：" + DEF;
            p5.textContent = "      速度：" + SPD;
            p6.textContent = "      暴击率：" + Crit_Rate;
            p7.textContent = "      暴击伤害：" + Crit_Damage;

            if(current_Light_cone){
                p8.textContent = "  装备光锥：";
            }
            else {
                p8.textContent = "  装备光锥：无";
            }
            p8.style = "font-size: 20px;"

            container.appendChild(p1);
            container.appendChild(p2);
            container.appendChild(p3);
            container.appendChild(p4);
            container.appendChild(p5);
            container.appendChild(p6);
            container.appendChild(p7);
            container.appendChild(p8);

            //然后还要将picture也加入
            container = document.getElementById('show_role_Light_Cones');
            container.innerHTML = '';
            if(current_Light_cone){
                var picture_url = "./picture/Light_cones/" + current_Light_cone + ".png";
                var img = document.createElement('img');
                img.src = picture_url;
                img.alt = current_Light_cone;

                container.appendChild(img);
            }
            else {
                var picture_url = "./picture/加号.png";
                var img = document.createElement('img');
                img.style = "max-width: 50%;max-height: 50%;"
                img.src = picture_url;
                img.alt = "添加";
                container.appendChild(img);
            }
        }