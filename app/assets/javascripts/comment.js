// 追加機能になるので一旦コメントアウトしています

// $(function() {
//     function buildHTML(comment){
//        var html = `<div class="comment_block">
//                     <div class="row">
//                       <div class="columns">
//                         <p>
//                           ${comment.text}
//                         </p>
//                       </div>
//                     </div>
//                    </div>`

//         return html;
//     };
//   $('#new_comment').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//       $.ajax ({
//         url: url,
//         type: "POST",
//         data: formData,
//         dataType: 'json',
//         processData: false,
//         contentType: false
//       })
//       .done(function(data) {
//           var html = buildHTML(data);
//           $('.form').before(html);
//           $('#comment_text').val('');
//           $('.submit').prop('disabled', false);
//           // 初回以降もボタンが押せるように
//       })
//       .fail(function() {
//         alert('コメント送信に失敗しました');
//       });
//   });
// });
