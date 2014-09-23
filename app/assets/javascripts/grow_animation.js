$(document).ready(function(){
  $(".results-image").each(function(index, image){
      $(image).on('load', function(){
          $(this).parents('.results-image-container').css('max-height', $(this).height());
      });
  });

  $(document).on('mouseenter', '.results-image', {}, function(){
      $(this).animate({width: "+=10", height: "+=10", right: "5px", bottom: "5px"}, 300);
  });

  $(document).on('mouseleave', '.results-image', {}, function(){
      $(this).animate({width: "-=10", height: "-=10", right: "0px", bottom: "0px"}, 300);
  });

//    $(".results-image").hover(function(){
//       // Mouse over
//       $(this).animate({width: "+=10", height: "+=10", right: "5px", bottom: "5px"}, 300);
//  }, function(){
//       // Mouse out
//       $(this).animate({width: "-=10", height: "-=10", right: "0px", bottom: "0px"}, 300);
//  });

});