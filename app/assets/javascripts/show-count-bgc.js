$(function() {
  $('.show-main__bgc').each(function(index, element) {
    // それぞれのトピックに対するコメント数を取得
    var left_c = $(this).find('.left-bg').attr('data_count');
    var right_c = $(this).find('.right-bg').attr('data_count');
    // 文字列を数値に変換
    var left = parseInt(left_c);
    var right = parseInt(right_c);
    // コメントの総数を取得
    var total = left + right;
    console.log(left);
    console.log(right);
    console.log(total);

    // コメントがどちらも０件でない時
    if (left !== 0 && right !== 0) {
      $(this).find('.left-bg').css('width', `${ left / total * 100 }%`);
      $(this).find('.right-bg').css('width', `${ right / total * 100 }%`);
    // コメントがどちらも０件の時
    } else if (left == 0 && right == 0) {
      // 処理なし
    // 左のトピックに対するコメントが０件の時
    } else if (left == 0){
      $(this).find('.left-bg').css('display', 'none');
      $(this).find('.right-bg').css('width', '100%');
    // 右のトピックに対するコメントが０件の時
    } else {
      $(this).find('.left-bg').css('width', '100%');
      $(this).find('.right-bg').css('display', 'none');
    };
  });
});
