$(function () {

  var btn = $('.ran-button');
  btn.hide();
  //スクロールが100に達したらボタン表示
  $(window).scroll(function () {
    if ($(this).scrollTop() > 400) {
      //ボタンの表示方法
      btn.fadeIn(100);
    } else {
      //ボタンの非表示方法
      btn.fadeOut(100);
    }
  });


  $('#openModal').click(function(){
      $('#modalArea').fadeIn();
  });
  $('#closeModal , #modalBg').click(function(){
    $('#modalArea').fadeOut();
  });
});
