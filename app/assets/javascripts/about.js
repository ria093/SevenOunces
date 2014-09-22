$(document).ready(function(){
  skrollr.init({
    smoothScrolling: false,
    mobileDeceleration: 0.004
  });

  var $root = $('html, body');
  $('#skrollr-body').find('a').click(function() {
    $root.animate({
      scrollTop: $( $.attr(this, 'href') ).offset().top - 60
    }, 500);
    return false;
  });
});