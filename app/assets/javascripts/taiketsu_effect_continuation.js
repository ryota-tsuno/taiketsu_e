$(function() {
  var taiketsu_red = '#FF0033'
  var taiketsu_yellow = '#FFFF00'
  $(window).on("load", function(){
    // taiketsusというpathにマッチした時、セッション取得
      if(document.URL.match("/taiketsus")) {
        var taiketsu = window.sessionStorage.getItem(['taiketsu_session']);
      }
      if(taiketsu == "taiketsu"){
        $('.about-header, .footer').css({
          'background-image' : 'url(/images/giphy.gif)',
        });
        $('.popular_title').css({
          'color' : taiketsu_red,
          'font-weight' : 'bold', 
          'text-shadow' : '8px 5px 5px #220000'
        });
        $('.footer__title, .footer__sentence, .footer__form--input__VS, .footer__form--sentence, .footer__form--btn').css({
            'color' : taiketsu_red,
            'font-weight' : 'bold', 
            'text-shadow' : '8px 5px 5px #220000'
        });
        $('.btn').css({
          'background-color' : taiketsu_red,
          'color' : taiketsu_yellow
        })
      }
      // root_pathにマッチした時、セッション破壊
      var url = location.pathname;
      if(url == '/') {
        window.sessionStorage.clear();
      }
  });
}) ;