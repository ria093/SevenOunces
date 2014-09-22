$(document).ready(function(){

  $(".results-image").hover(function(){
      //     console.log("IN");
       // Mouse over
       $(this).animate({width: "+=10", height: "+=10", right: "5px", bottom: "5px"}, 300);
  }, function(){
       // Mouse out
       $(this).animate({width: "-=10", height: "-=10", right: "0px", bottom: "0px"}, 300);
  });

});

