$(function(){
  var $target = $('.main__posts--list');
  var navy = '#1f3748';
  var white = 'white';
  var black = 'black';
  var speed = 150;
  var easing = 'linear';

  $target.on("mouseover", function(){
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
  }).on("mouseout", function(){
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
