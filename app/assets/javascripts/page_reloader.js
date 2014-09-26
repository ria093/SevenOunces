$(document).ready(function(){

    var showRecipes = function() {
        $.each($(".api-result"), function(index, result){
            $(result).delay(index * 100).animate({ opacity: 1, top: 0 }, 300);
        });
    };

    showRecipes();

    $(".page-reloader").click(function() {
        $.get("/external_recipes", function(data){
            var results;

            // Clear out old recipes
            $('.api-results').empty();

            // Add new recipes to results list with animations.
            results = $('.api-results .col-md-4', data);
            $('.api-results').append(results);
            showRecipes();

        });
    });
});

$(document).ready(function(){

    var showRecipes = function() {
        $.each($(".api-result"), function(index, result){
            $(result).delay(index * 100).animate({ opacity: 1, top: 0 }, 300);
        });
    };


});
