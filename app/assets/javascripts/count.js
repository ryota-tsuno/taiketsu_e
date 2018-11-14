$(function() {

  countComments();

  function countComments() {
    $('.main__posts--list').each(function(index, element) {
      // それぞれのトピックに対するコメント数を取得
      var left = $(this).find('.main__posts--list__vote--left').text()
      var right = $(this).find('.main__posts--list__vote--right').text()
      // 文字列を数値に変換
      var left_count = parseInt(left)
      var right_count = parseInt(right)
      // コメントの総数を取得
      var total = left_count + right_count

      // コメントがどちらも０件でない時
      if (left_count !== 0 && right_count !== 0) {
        $(this).find('.main__posts--list__vote--left').css('width', `${ left_count / total * 100 }%`)
        $(this).find('.main__posts--list__vote--right').css('width', `${ right_count / total * 100 }%`)
      // コメントがどちらも０件の時
      } else if (left_count == 0 && right_count == 0) {
        // 処理なし
      // 左のトピックに対するコメントが０件の時
      } else if (left_count == 0){
        $(this).find('.main__posts--list__vote--left').css('display', 'none')
        $(this).find('.main__posts--list__vote--right').css('border-radius', '7px').css('width', '100%')
      // 右のトピックに対するコメントが０件の時
      } else {
        $(this).find('.main__posts--list__vote--left').css('border-radius', '7px').css('width', '100%')
        $(this).find('.main__posts--list__vote--right').css('display', 'none')
      };
    });
  }
});
