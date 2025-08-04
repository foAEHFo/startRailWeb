var current_Light_cone
var container

window.onload = function(){
    initElement();
    initEvent();
}

function initElement(){
    current_Light_cone = localStorage.getItem('current_Light_cone');
    container = document.getElementById('show_picture');
}

function initEvent(){
    console.log("this is home_light_cone click");
    if (current_Light_cone){
        console.log("当前的光锥是",current_Light_cone);
        var picture_url = "./picture/Light_cones/" + current_Light_cone + "2.png"
        
        container.innerHTML = '';
        var img = document.createElement('img');
        img.src = picture_url;
        img.alt = current_Light_cone;

        container.appendChild(img);
    }
}
