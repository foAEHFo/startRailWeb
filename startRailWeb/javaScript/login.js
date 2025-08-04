//登录有关的全局变量
var loginButton
var phone_input
var password_input

var uid;
//uid 记录了玩家的编号


export function init(){
    initElement();
    initEvent();
}

export function getuid(){
    return uid;
}

function initElement(){
    localStorage.setItem("current_role",'');
    localStorage.setItem("current_Light_cone",'');
    loginButton = document.getElementById("login_button")
    phone_input = document.getElementById("phone_input")
    password_input = document.getElementById("password_input")
}

function initEvent(){
    if(loginButton){
        loginButton.onclick = function(){
            console.log("点击登录")
            login();
        }
    }
}
//登录函数
function login(){
    var phone = phone_input.value
    var password = password_input.value
    
    if(String(phone).length != 11){
        alert("手机号输入格式不正确")
        return;
    }
    if(String(password).length == 0){
        alert("密码不能为空")
        return;
    }
    fetch('http://localhost:5000/login',{
        method:'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            'phone' : phone,
            'password' : password
        })
    })
    .then(response => {
        if (!response.ok) return response.json().then(err => Promise.reject(err))
        return response.json()
    })
    .then(data => {
        if(data.success){
            uid = data.uid;
            localStorage.setItem('currentUID', uid);
            alert("登录成功");
            window.location.href = "./home.html"
        }
        else {
            alert("手机号或密码输入错误");
        }

    })
    .catch(error => {
        console.error('Error:', error);
        alert(error.message || "发生错误");
    });
}