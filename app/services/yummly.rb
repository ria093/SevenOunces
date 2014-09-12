class Yummly

  class SearchResult

    attr_accessor :name, :rating, :prep_time, :ingredients, :url_sm, :recipe_id
    def initialize(name, rating, prep_time, ingredients, url_sm, recipe_id)
      @name = name
      @rating = rating
      @prep_time = prep_time
      @ingredients = ingredients
      @url_sm = url_sm || 'not-available.png'
      @recipe_id = recipe_id
    end

    def yummly_url
      "http://www.yummly.com/recipe/#{recipe_id}"
    end

  end

  def self.search(recipe_name)
    recipes_response = Faraday.get('http://api.yummly.com/v1/api/recipes',
                                   _app_id: ENV['YUMMLY_APP_ID'],
                                   _app_key: ENV['YUMMLY_APP_KEY'],
                                   q: recipe_name,
                                   maxResult: 9,
                                   start: rand(300))
    JSON.parse(recipes_response.body)['matches'].map do |recipe_json|
      SearchResult.new(recipe_json['recipeName'], recipe_json['rating'], recipe_json['totalTimeInSeconds'],
                       recipe_json['ingredients'], recipe_json['smallImageUrls'].try(:first), recipe_json['id'])


    end
  end

end
