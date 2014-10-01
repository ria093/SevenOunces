$(document).ready(function(){

  $( ".logo-lg" ).delay( 400 ).animate({
    opacity: 1
  }, 900);

  $( ".panel-home" ).delay( 400 ).animate({
    opacity: 0.8
  }, 900);

  $( "#home-footer" ).delay( 400 ).animate({
      opacity: 1
  }, 900);

  !function(d,s,id){
    var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
    if(!d.getElementById(id)){
      js=d.createElement(s);js.id=id;
      js.src=p+'://platform.twitter.com/widgets.js';
      fjs.parentNode.insertBefore(js,fjs);
    }
  }(document, 'script', 'twitter-wjs');

  $('form[name="places_form"]').submit(function() {
    if ($('form[name="places_form"]').find('input[name="location"]').val().trim() !== '' ) {
      return true;
    } else {
      $('#zip_alert').html("Please enter your location.");
      return false;
    }
  });

});

