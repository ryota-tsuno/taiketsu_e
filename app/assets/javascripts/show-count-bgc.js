$(function() {
  $('.show-main__bgc').each(function(index, element) {
    // それぞれのトピックに対するコメント数を取得
    var left_c = $(this).find('.left-count').text();
    var right_c = $(this).find('.right-count').text();
    // 文字列を数値に変換
    var left = parseInt(left_c);
    var right = parseInt(right_c);
    // コメントの総数を取得
    var total = left + right;

    // コメントがどちらも０件でない時
    if (left !== 0 && right !== 0) {
      $(this).find('.left-bg').css('width', `${ left / total * 100 }%`);
      $(this).find('.right-bg').css('width', `${ right / total * 100 }%`);
      $('.main__name--bottom').find('.wanted_title').css('color', 'white');
    // コメントがどちらも０件の時
    } else if (left == 0 && right == 0) {
      $('.main__name--bottom').find('.wanted_title').css('color', 'white');
      // 処理なし
    // 左のトピックに対するコメントが０件の時
    } else if (left == 0){
      $(this).find('.left-bg').css('display', 'none');
      $(this).find('.right-bg').css('width', '100%');
      $('.main__name--bottom').find('.wanted_title').css('color', 'white');
    // 右のトピックに対するコメントが０件の時
    } else {
      $(this).find('.left-bg').css('width', '100%');
      $(this).find('.right-bg').css('display', 'none');
      $('.main__name--bottom').find('.wanted_title').css('color', 'white');
    };
  });
});
