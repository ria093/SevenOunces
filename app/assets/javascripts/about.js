$(document).ready(function(){
  
  if ( !( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) ) {
    skrollr.init({
        smoothScrolling: true,
        mobileDeceleration: 0.004
    });
  }

  var $root = $('html, body');
  $('#skrollr-body').find('a').click( function() {
    $root.animate({
      scrollTop: $( $.attr(this, 'href') ).offset().top - 65
    }, 500);
    return false;
  });
});