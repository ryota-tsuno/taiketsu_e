$(function(){
  var navy = '#1f3748';
  var white = 'white';
  var black = 'black';
  var speed = 150;
  var easing = 'linear';

  $(document).on("mouseover", '.main__posts--list', function(){
      $(this).stop().animate({
        backgroundColor: navy
      }, speed, easing);
      $(this).find('.main__posts--list__title').stop().animate({
        color: white
      }, speed, easing);
      $(this).find('.VS').stop().animate({
        backgroundColor: white,
        color: navy
      }, speed, easing);
  }).on("mouseout", '.main__posts--list',function(){
      $(this).stop().animate({
        backgroundColor: white
      }, speed, easing);
      $(this).find('.main__posts--list__title').stop().animate({
        color: black
      }, speed, easing);
      $(this).find('.VS').stop().animate({
        backgroundColor: navy,
        color: white
      }, speed, easing);
    });
});
