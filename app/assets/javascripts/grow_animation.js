$(document).ready(function(){
  $(".results-image").each( function(index, image) {
    $(image).on('load', function(){
      $(this).parents('.results-image-container').css('max-height', $(this).height());
    });
  });

  $(document).on('mouseenter', '.results-image', {}, function() {
    $(this).fadeTo("fast", 0.8);
    //$(this).animate({width: "+=10", height: "+=10", right: "5px", bottom: "5px"}, 300);
  });

  $(document).on('mouseleave', '.results-image', {}, function() {
    $(this).fadeTo("fast", 1);
    //$(this).animate({width: "+=10", height: "+=10", right: "5px", bottom: "5px"}, 300);
  });
  
});