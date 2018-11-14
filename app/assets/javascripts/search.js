$(function() {

var search_panel = $(".main__posts:first");

function appendTopic(taiketsu) {
  var html = `<div class="main__posts--list">
                <a class="link" href="/taiketsus/${ taiketsu.id }">
                  <div class="main__posts--list__title">
                    ${ taiketsu.first_topic }
                  </div>
                  <div class="VS">
                    VS
                  </div>
                  <div class="main__posts--list__title">
                    ${ taiketsu.second_topic }
                  </div>
                  <div class="main__posts--list__vote">
                    <div class="main__posts--list__vote--left">
                      ${ taiketsu.left_count }
                    </div>
                    <div class="main__posts--list__vote--right">
                      ${ taiketsu.right_count }
                    </div>
                  </div>
                </a>
              </div>`
    search_panel.append(html);
}

function appendNoTopic(taiketsu) {
  var html = `<div class="main__posts--list" style="font-size:17px; line-height: 160px;">
                ${ taiketsu }
              </div>`
    search_panel.append(html);
}

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
    // 左のトピックに対するコメントが0件の時
    } else if (left_count == 0){
      $(this).find('.main__posts--list__vote--left').css('display', 'none')
      $(this).find('.main__posts--list__vote--right').css('border-radius', '7px').css('width', '100%')
    // 右のトピックに対するコメントが0件の時
    } else {
      $(this).find('.main__posts--list__vote--left').css('border-radius', '7px').css('width', '100%')
      $(this).find('.main__posts--list__vote--right').css('display', 'none')
    };
  });
}

  $('.form__input').on('keyup', function() {
    var input = $('.form__input').val();
    if (input == '') {
      $('.main__posts').empty();
    }
    else {
      var pathname = location.pathname;
      $.ajax({
        type: 'GET',
        url: pathname,
        data: { keyword: input},
        dataType: 'json'
      })

      .done(function(taiketsus) {
        $('.main__posts').empty();
        if (taiketsus.length !== 0) {
          taiketsus.forEach(function(taiketsu) {
            appendTopic(taiketsu);
            $('.wanted_title').text('')
            $('.popular_title').text('検索結果')
            countComments();
          });
        }
        else {
          appendNoTopic("一致するお題はありません");
          $('.wanted_title').text('')
          $('.popular_title').text('検索結果')
        }
      })
      .fail(function() {
        alert('エラーが起きました');
      });
    }
  });
});
