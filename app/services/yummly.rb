class Yummly

  include Enumerable

  attr_accessor :search_results, :error
  def initialize(search_results, error = nil)
    @search_results = search_results
    @error = error
  end

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

  class Error

    attr_accessor :code, :msg
    def initialize(code, msg)
      @code = code
      @msg = msg
    end

  end

  def each(&block)
    search_results.each(&block)
  end

  class << self

    def search(recipe_name)
      page = rand(1..40)
      all_results = Rails.cache.fetch("yummly-page-#{page}", expires_in: 1.day) {
        Faraday.get('http://api.yummly.com/v1/api/recipes',
                     _app_id: ENV['YUMMLY_APP_ID'],
                     _app_key: ENV['YUMMLY_APP_KEY'],
                     q: recipe_name,
                     maxResult: 12,
                     start: page,
                     requirePictures: true).body
      }
      filtered_results = filter_results(all_results)
      return new(nil, Error.new(0, 'We could not find any recipes at this time. Please try again later.')) unless filtered_results.present?
      new(filtered_results, nil)
    rescue => exception
      new(nil, Error.new(0, 'We could not find any recipes at this time. Please try again later.'))
    end

    private

    def filter_results(results)
      JSON.parse(results)['matches'].map do |recipe_json|
        SearchResult.new(recipe_json['recipeName'], 
                         recipe_json['rating'], 
                         recipe_json['totalTimeInSeconds'],
                         recipe_json['ingredients'], 
                         display_img_url(recipe_json['smallImageUrls'].try(:first)), 
                         recipe_json['id'])
      end
    end

    # Since image URL paths only differ by size parameter, 
    # replacing 's=90' by 's=360' will result in larger images 
    # without the extra API calls. Note, this only works
    # because images are required in the search. Otherwise,
    # there may not always be a large URL.
    def display_img_url(url)
      url.sub(/s90$/, 's360') 
      # recipe_response = Faraday.get("http://api.yummly.com/v1/api/recipe/#{id}",
      #                               _app_id: ENV['YUMMLY_APP_ID'],
      #                               _app_key: ENV['YUMMLY_APP_KEY'])
      # image = JSON.parse(recipe_response.body)['images'].try(:first)
      # image['hostedLargeUrl'].present? ? image['hostedLargeUrl'] : image['hostedMediumUrl'] if image.present?
    end

  end

end

