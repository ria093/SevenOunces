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
    page = rand(500)
    Rails.cache.fetch("yummly-page-#{page}", expires_in: 1.day) {
      recipes_response = Faraday.get('http://api.yummly.com/v1/api/recipes',
                                     _app_id: ENV['YUMMLY_APP_ID'],
                                     _app_key: ENV['YUMMLY_APP_KEY'],
                                     q: recipe_name,
                                     maxResult: 12,
                                     start: page,
                                     requirePictures: true)
      JSON.parse(recipes_response.body)['matches'].map do |recipe_json|
        SearchResult.new(recipe_json['recipeName'], recipe_json['rating'], recipe_json['totalTimeInSeconds'],
                         recipe_json['ingredients'], display_img_url(recipe_json['smallImageUrls'].try(:first)), recipe_json['id'])
      end
    }
  end

  private

  # Since image URL paths only differ by size parameter, 
  # replacing 's=90' by 's=360' will result in larger images 
  # without the extra API calls. Note, this only works
  # because images are required in the search. Otherwise,
  # there may not always be a large URL.
  def self.display_img_url(url)
    url.sub(/s90$/, 's360') 
    # recipe_response = Faraday.get("http://api.yummly.com/v1/api/recipe/#{id}",
    #                               _app_id: ENV['YUMMLY_APP_ID'],
    #                               _app_key: ENV['YUMMLY_APP_KEY'])
    # image = JSON.parse(recipe_response.body)['images'].try(:first)
    # image['hostedLargeUrl'].present? ? image['hostedLargeUrl'] : image['hostedMediumUrl'] if image.present?
  end

end

