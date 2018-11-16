$(function() {
  // 意見投稿フォームから上へのスクロール
  $('.jump_icon').on('click', function() {
    $('html,body').animate({scrollTop: 0}, 500, 'swing');
  });

  // 左の意見投稿フォームへのスクロール
  $('.icon-left').on('click', function() {
    event.preventDefault();
    $('html,body').animate({scrollTop: $('.left')[0].scrollHeight}, 500, 'swing');
  });

  // 右の意見投稿フォームへのスクロール
  $('.icon-right').on('click', function() {
    event.preventDefault();
    $('html,body').animate({scrollTop: $('.right')[0].scrollHeight}, 500, 'swing');
  });
});
