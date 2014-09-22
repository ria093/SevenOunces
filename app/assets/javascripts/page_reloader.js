$(document).ready(function(){

    var showRecipes = function() {
        $.each($(".yummly-recipe-result"), function(index, result){
            $(result).delay(index * 100).animate({ opacity: 1, top: 0 }, 300);
        });
    };

    showRecipes();

    $("#page-reloader").click(function() {
        $.get("/external_recipes", function(data){
            var results;

            // Clear out old recipes
            $('#yummly-recipe-results').empty();

            // Add new recipes to results list with animations.
            results = $('#yummly-recipe-results .col-md-4', data);
            $('#yummly-recipe-results').append(results);
            showRecipes();

            // Add glimmer effects to all .results-box elements on hover
            //addGlimmer();
        });
    });
});


