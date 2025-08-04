var show_relic_container
var uid
var relics_data

var getNewButton
var comeback_button
var getNewRelic
var show_relic_information_container
var navigate_role
var navigation_Relic
var navigation_Light_Cones

var relic_map
var effect_map
var relic_body_map
var relics_count

//定义一个数组来存放遗器所有可能的词条
var entry;
//存放所有的词条的满级数值
var entry_value


window.onload = function () {
    initElement();
    initEvent();
}

function initElement() {
    entry = [
        "生命值","防御力","攻击力","生命值百分比","防御力百分比","攻击力百分比",
        "速度","暴击率","暴击伤害","效果命中","效果抵抗","击破特攻"
    ];
    entry_value = new Map();
    //初始化一下遗器属性表
    init_entry_value();

    getNewButton = document.getElementById("get_new_button");
    getNewRelic = document.getElementById("get_button");
    show_relic_information_container = document.getElementById("show_relic_information");
    comeback_button = document.getElementById("come_back");
    show_relic_container = document.getElementById("show_relics");
    navigate_role = document.getElementById("all_roles");
    navigation_Relic = document.getElementById("my_Relic");
    navigation_Light_Cones = document.getElementById("all_Light_Cones"); 
    uid = localStorage.getItem("currentUID");

    relic_map = new Map();
    effect_map = new Map();
    relic_body_map = new Map();
    relics_count = new Map();
}

function initEvent() {
    console.log("你进入了relics.js");
    login(true);
    getNewButton.addEventListener('click', () => {
        // 触发拉伸动画
        show_relic_information_container.classList.add('collapsed');
    });
    getNewRelic.addEventListener('click',() => {
        //触发获取新的遗器的函数
        var pack = document.getElementById("get_pack").value;
        var body = document.getElementById("get_body").value;
        if(!pack){
            alert("请选择要获取的遗器套装");
            return ;
        }
        if(!body){
            alert("请选择要获取的遗器部位");
            return ;
        }
        make_NewRelic(pack,body);
    });
    comeback_button.addEventListener('click', () => {
        //触发返回动画
        show_relic_information_container.classList.toggle('collapsed');
    });
    show_relic_container.addEventListener('click', function (event) {
        if (event.target.tagName == 'IMG') {
            console.log('展示遗器信息');
            //恢复相关信息为可见
            show_relic_information(event);
        }
    });
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

function init_entry_value(){
    entry_value.set("攻击力",["56","76","96","116","135","155","352"]);
    entry_value.set("生命值",["112","152","191","231","270","310","705"]);
    entry_value.set("防御力",["56","76","96","116","135","155","352"]);
    entry_value.set("攻击力百分比",["6.9%","9.3%","11.7%","14.1%","16.5%","19.0%","43.2%"]);
    entry_value.set("生命值百分比",["6.9%","9.3%","11.7%","14.1%","16.5%","19.0%","43.2%"]);
    entry_value.set("防御力百分比",["8.6%","11.6%","14.6%","17.7%","20.7%","23.7%","54%"]);
    entry_value.set("暴击率",["5.1%","7.0%","8.8%","10.6%","12.4%","14.2%","32.4%"]);
    entry_value.set("暴击伤害",["10.3%","14.0%","17.6%","21.2%","24.8%","28.5%","64.8%"]);
    entry_value.set("效果命中",["6.9%","9.3%","11.7%","14.1%","16.5%","19.0%","43.2%"]);
    entry_value.set("治疗量加成",["5.5%","7.4%","9.4%","11.3%","13.2%","15.2%","34.5%"]);
    entry_value.set("速度",["4","5","6","8","9","11","25"]);
    entry_value.set("攻击力百分比",["6.9%","9.3%","11.7%","14.1%","16.5%","19.0%","43.2%"]);
    entry_value.set("击破特攻",["5.4%","10.3%","14.9%","18.3%","24.8%","28.5%","64.8%"]);
    entry_value.set("效果抵抗",["4.3%","8.6%","12.9%","16.5%","19.8%","24.6%","43.2%"]);

}

function splitTextAndNumber(input) {
    const match = input.match(/^(.*?)(\d*)$/);
    if (!match) {
        return { text: input, number: '' };
    }
    const text = match[1];
    const number = match[2];
    return [text, number];
}

function login(Is_get_all_relics) {
    fetch('http://localhost:5000/relics_get', {
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
                relics_data = data.result;
                //接下来把所有的信息都存放在一个哈希表中
                //并且把每一种遗器的个数也维护一下
                for (var i = 0; i < relics_data.length; i++) {
                    var tmp = relics_data[i];
                    var key = relics_data[i]['name'] + relics_data[i]['id'];
                    var value = get_relic_information(tmp);

                    relic_map.set(key, value);
                }
                for (var i = 0; i < relics_data.length; i++) {
                    relics_count.set(relics_data[i]['name'], relics_data[i]['id']);
                }
                show_relic_container.innerHTML = '';
                //把所有的遗器都打印出来
                for (var i = 0; i < relics_data.length; i++) {
                    var name = relics_data[i]['name'];
                    var picture_url = "./picture/relics/" + name + ".png";
                    var img = document.createElement('img');
                    img.src = picture_url;
                    img.alt = name + relics_data[i]['id'];

                    show_relic_container.appendChild(img);
                    console.log("遗器查询成功");
                }
                console.log("遗器查询成功");
            }
            else {
                alert("遗器查询失败");
            }

        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生错误");
        });

    if(Is_get_all_relics){
        fetch('http://localhost:5000/all_relics_get', {
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
                var effect = data.result;
                //console.log(effect);
                for (var i = 0; i < effect.length; i++) {
                    //这里我们顺便也初始化一下获取遗器的选择栏
                    int_get_select(effect[i]['name']);
                    var data = {
                        effect1: effect[i]['effect1'],
                        effect2: effect[i]['effect2'],
                    }
                    effect_map.set(effect[i]['name'], data);
                    
                    var data2 = {
                        "头部":effect[i]['head_name'],
                        "手机":effect[i]['hand_name'],
                        "躯干":effect[i]['trunk_name'],
                        "脚部":effect[i]['feet_name']
                    }
                    relic_body_map.set(effect[i]['name'],data2);
                }
            }
            else {
                alert("套装信息查询失败");
            }

        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生错误");
        });
    }
}

function int_get_select(name){
    var container = document.getElementById("get_pack");
    var option = document.createElement("option");
    option.value = name;
    option.textContent = name;
    container.appendChild(option);
}

function get_relic_information(relic) {
    var value = {
        body: relic['body'],
        main_entry: relic['main_entry'],
        secondary_entry1: relic['secondary_entry1'],
        secondary_entry2: relic['secondary_entry2'],
        secondary_entry3: relic['secondary_entry3'],
        secondary_entry4: relic['secondary_entry4'],
        pack: relic['package']
    }
    return value;
}

function show_relic_information(event) {
    document.querySelector(".collapsed-indicator").style.display = "block";
    document.querySelector(".relic-info-container").style.display = "block";
    //接下来获取该遗器的信息
    var name;
    var id;
    var tmp = splitTextAndNumber(event.target.alt);
    name = tmp[0];
    id = tmp[1];
    var pack = relic_map.get(event.target.alt).pack;
    console.log("套装名称:", pack);

    //在此可以打印该遗器的信息了
    document.querySelector(".relic-name").textContent = name;
    document.querySelector(".relic-part").textContent = relic_map.get(event.target.alt).body;
    var attribute_label = document.querySelectorAll(".attribute-label");
    var attribute_value = document.querySelectorAll(".attribute-value");

    var tmp = split_lable_value(relic_map.get(event.target.alt).main_entry);
    var main_lable = tmp[0];
    var main_value = tmp[1];
    console.log(main_lable);
    attribute_label[0].textContent = main_lable;
    attribute_value[0].textContent = main_value;

    for (var i = 1; i <= 4; i++) {
        var str = "secondary_entry" + i;
        var tmp = split_lable_value(relic_map.get(event.target.alt)[str]);
        var lable = tmp[0];
        var value = tmp[1];
        attribute_label[i].textContent = lable;
        attribute_value[i].textContent = value;
    }

    document.querySelector(".set-name").textContent = pack;
    var set_effect = document.querySelectorAll(".set-effect-item");
    
    set_effect[0].innerHTML = `<strong>二件套:</strong> ${effect_map.get(pack).effect1}`;
    set_effect[1].innerHTML = `<strong>四件套:</strong> ${effect_map.get(pack).effect2}`;
}

function split_lable_value(str) {
    var begin1;
    var begin2;
    var is_first = true;
    for (var i = 0; i < str.length; i++) {
        if (str[i] == ' ' && is_first) {
            is_first = false;
            begin1 = i;
        }
        if (i > 0 && str[i - 1] == ' ' && str[i] != ' ') {
            begin2 = i;
            break;
        }
    }
    var lable = str.substring(0, begin1 - 1);
    console.log("lable:", lable);
    var value = str.substring(begin2, str.length);
    return [lable, value];
}

function make_NewRelic(pack,body){
    var entry_tmp = entry.slice(0);
    //要获取一个遗器，就得确定它的主词条和4个副词条
    //首先确定主词条
    var main_entry;
    var main_entry_value;
    if(body == "头部"){
        main_entry = "生命值";
        main_entry_value = entry_value.get(main_entry)[6];
    }
    else if(body == "手部"){
        main_entry = "攻击力";
        main_entry_value = entry_value.get(main_entry)[6];
    }
    else{
        var tmp = random_main_entry(body);
        main_entry = tmp[0];
        main_entry_value = tmp[1];

        //从所有属性的表中剔除已经选择的主词条
        var index = entry_tmp.indexOf(main_entry);
        if (index !== -1) {
            entry_tmp.splice(index, 1);
        }
    }
    //建立属性数组
    var value = [];
    value.push(standard(main_entry,main_entry_value));
    var level = 5;
    //接下来要选择副词条
    for(var i = 0;i<4;i++){
        var tmp = random_secondary_entry(level,entry_tmp);
        var secondary_entry = tmp[0];
        var secondary_entry_value = tmp[1];

        //维护目前可分配的升级点数
        console.log(level)
        level -= tmp[2];
        //每选择一个，就要从属性表里删除一个可选项
        var index = entry_tmp.indexOf(secondary_entry);
        if (index !== -1) {
            entry_tmp.splice(index, 1);
        }

        value.push(standard(secondary_entry,secondary_entry_value));
    }
    //连接数据库，上传这次获取到的新遗器
    var name = relic_body_map.get(pack)[body];
    var id = 0
    if(relics_count.has(name)){
        id = relics_count.get(name);
    }
    id++;
    fetch('http://localhost:5000/Insert_new_relic', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'owner_uid':uid,
            'name':name,
            'id':id,
            'body':body,
            'main_entry':value[0],
            'secondary_entry1':value[1],
            'secondary_entry2':value[2],
            'secondary_entry3':value[3],
            'secondary_entry4':value[4],
            'package':pack
        })
    })
        .then(response => {
            if (!response.ok) return response.json().then(err => Promise.reject(err))
            return response.json()
        })
        .then(data => {
            if (data.success) {
                //在这里要进行前端页面更新工作
                login(false);
                alert("获取成功!");
            }
            else {
                alert("套装信息查询失败");
            }

        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message || "发生错误");
        });

}

function random_main_entry(body){
    var trunk_main_entry = ["生命值百分比","攻击力百分比","防御力百分比",
      "暴击率","暴击伤害","治疗量加成","效果命中"];
    var feet_main_entry = ["生命值百分比","攻击力百分比","防御力百分比","速度"];

    if(body == "躯干"){
        //随机数坐索引抽取一个属性作为主词条
        var random = Math.floor(Math.random() * 7);
        var main_entry = trunk_main_entry[random];
        //再给它升到满级
        var main_entry_value = entry_value.get(main_entry)[6];
        return [main_entry,main_entry_value];
    }
    else {
        //随机数坐索引抽取一个属性作为主词条
        var random = Math.floor(Math.random() * 4);
        var main_entry = feet_main_entry[random];
        //再给它升到满级
        var main_entry_value = entry_value.get(main_entry)[6];
        return [main_entry,main_entry_value];
    }
}

function standard(main_entry,main_entry_value){
    if(main_entry.includes("百分比")){
        main_entry = main_entry.slice(0,3);
    }
    return main_entry + "：  " + main_entry_value;
}

function random_secondary_entry(level,entry_tmp){
    var random = Math.floor(Math.random() * entry_tmp.length);
    var this_level = Math.floor(Math.random() * level);
    var secondary_entry = entry_tmp[random];
    console.log(secondary_entry);
    var secondary_entry_value = entry_value.get(secondary_entry)[this_level];
    return [entry_tmp[random],secondary_entry_value,this_level];
}