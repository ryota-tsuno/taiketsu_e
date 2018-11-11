// 追加機能になるので一旦コメントアウトしています

$(function() {
    function buildHTML(comment){
       var html = `<div class="comment_block">
                    <div class="row">
                      <div class="columns">
                        <p>
                          ${comment.text}
                        </p>
                      </div>
                    </div>
                   </div>`

        return html;
    };
  // $('#new_comment_pri').on('submit', function(e){
  //   e.preventDefault();
  //   var formData = new FormData(this);
  //   var url = $(this).attr('action');
  //     $.ajax ({
  //       url: url,
  //       type: "POST",
  //       data: formData,
  //       dataType: 'json',
  //       processData: false,
  //       contentType: false
  //     })
  //     .done(function(data) {
  //       $('.submit').prop('disabled', false);
  //       // 初回以降もボタンが押せるように
  //       console.log(1)
  //       var html = buildHTML(data);
  //       console.log(html);
  //       $('.form').before(html);
  //       $('#new_comment_pri').val('');
  //       console.log(2)
  //     })
  //     .fail(function() {
  //       alert('コメント送信に失敗しました');
  //     });
  // });
  $('#new_comment_pri').on('submit', function(e){
    e.preventDefault();
    alert('こんにちは');
  });

});
