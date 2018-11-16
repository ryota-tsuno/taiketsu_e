$(function (){
    var taiketsu_red = '#FF0033'
    var taiketsu_yellow = '#FFFF00'
    $('.btn1').on('click', function(){
        $(this).prop("disabled", true);
        $(this).remove('');
        $(this).css({
            'background-color' : taiketsu_red,
            'color' : taiketsu_yellow,
        })
        // .btn1がクリックされたらセッション登録
        window.sessionStorage.setItem(['taiketsu_session'],["taiketsu"]);
        $('.btn').css({
            'background-color' : taiketsu_red,
            'color' : taiketsu_yellow
        })
        $('.header, .footer').css({
            'background-image' : 'url(./images/giphy.gif)',
        });
        $('.header').css({
            'height' : '630px'
        })
        $('.main').css({
            'background-image' : 'url(./images/boxing.jpg)',
            'background-repeat' : 'none',
            'background-size' : 'cover'
        })
        $('.header__middle--button').prepend("<img src = './images/jhonson.png' width = 250' height = '300'>");
        $('.header__middle--button').append("<img src = './images/resura.png' width = '250' height = '300'>");
        $('.header__middle--button').css({
            'width' : '700px',
        })
        $('.header__middle--sentence').css({
            'color' : taiketsu_red,
            'font-weight' : 'bold', 
            'font-size' : '30px',
            'text-shadow' : '8px 5px 5px #220000'
        });
        $('.icon').css({
            'color' : 'black',
            'border' : 'solid 1px black',
        });
        $('.popular_title, .wanted_title').css({
            'color' : taiketsu_red,
            'font-weight' : 'bold', 
            'text-shadow' : '8px 5px 5px #220000'
        });
        $('.footer__title, .footer__sentence, .footer__form--input__VS, .footer__form--sentence').css({
            'color' : taiketsu_red,
            'font-weight' : 'bold', 
            'text-shadow' : '8px 5px 5px #220000'
        });
    });

    $('.fa-arrow').on('click', function(){
        window.sessionStorage.setItem(['taiketsu_session'],["taiketsu"]);
    })
})