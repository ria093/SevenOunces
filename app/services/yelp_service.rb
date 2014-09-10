class YelpService
  
  include Enumerable

  attr_accessor :search_results, :error
  def initialize(search_results, error = nil)
    @search_results = search_results
    @error = error
  end
  
  class SearchResult
    attr_accessor :name, :rating, :phone, :distance, :address, :rating_img_url, :img_url
    def initialize(name, rating, phone, distance, address, rating_img_url, img_url)
      @name = name
      @rating = rating
      @phone = phone
      @distance = distance
      @address = address
      @rating_img_url = rating_img_url
      @img_url = img_url
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

  def self.search(term, category, location)
    return new(nil, Error.new(1, 'Please enter a valid zipcode.')) unless location.strip =~ /^[0-9]{5}$/
    all_results = call_API(location, set_params(term, category))
    filtered_results = filter_results(all_results)
    return new(nil, Error.new(0, 'Oh no! No one currently serves Nutella in your area. :(')) unless filtered_results.present?
    new(filtered_results, nil)
  rescue => exception
    if exception.is_a?(Yelp::Error::UnavailableForLocation)
      new(nil, Error.new(1, 'Uh oh! It looks like the zipcode you entered is not valid.'))
    else
      new(nil, Error.new(0, 'Oh no! It looks like something went wrong.'))
    end
  end

  private

  def self.set_params(term, category)
    { 
      term: term,
      category: category,
      limit: 20, # Max number of results returned
      offset: 0, # Offset the list of returned results
      sort: 0, # Sort by highest-rated
      radius_filter: 1600 # Search radius set to 1 mile
    }
  end

  def self.call_API(location, params)
    JSON.parse(Yelp.client.search(location,params).to_json)
  end

  def self.filter_results(results)
    results['businesses'].select { |business| business['is_closed'] == false }.map do |place|
      SearchResult.new(place['name'], place['rating'], place['display_phone'], place['distance'], place['location']['display_address'], place['rating_img_url_small'], place['image_url'])
    end
  end

end