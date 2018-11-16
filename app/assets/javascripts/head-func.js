$(function(){

  //headerの小さい方
  var nav = $('.about-header');
  //オススメ用のボタン
  var btn = $('.ran-button');

  //indexページでは,はじめは小さいheaderを隠す
  if(window.location.href.match(/\/$/)){
    nav.hide();
    //ボタンを隠す
    btn.hide();
    $(window).scroll(function () {

      if ( $(this).scrollTop() > 600){
        nav.fadeIn(500);
        nav.addClass('fixed');
        btn.fadeIn(100);
      } else {
        nav.fadeOut(0);
        nav.removeClass('fixed');
        btn.fadeOut(100);
      }

    });

  }


});
