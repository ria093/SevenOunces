class Yummly

  class SearchResult

    attr_accessor :name, :rating, :prep_time, :ingredients, :url_sm
    def initialize(name, rating, prep_time, ingredients, url_sm)
      @name = name
      @rating = rating
      @prep_time = prep_time
      @ingredients = ingredients
      @url_sm = url_sm || 'not-available.png'

    end

  end

  def self.search(recipe_name)
    recipes_response = Faraday.get('http://api.yummly.com/v1/api/recipes',
                                   _app_id: ENV['YUMMLY_APP_ID'],
                                   _app_key: ENV['YUMMLY_APP_KEY'],
                                   q: recipe_name)
    JSON.parse(recipes_response.body)['matches'].map do |recipe_json|
      SearchResult.new(recipe_json['recipeName'], recipe_json['rating'], recipe_json['totalTimeInSeconds'],
                       recipe_json['ingredients'], recipe_json['smallImageUrls'].try(:first))


    end
  end

end
