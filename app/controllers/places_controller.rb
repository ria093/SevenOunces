class PlacesController < ApplicationController
  
  def index
    term = 'nutella'; category = 'restaurants'
    @location = (params['location'].present? ? params['location'] : 'San Francisco, CA')
    @places = YelpService.search(term, category, @location)

    # if @places.error.present? && @places.error.code  == 1
    #   redirect_to request.referer, notice: @places.error.msg
    # end
  end

end
