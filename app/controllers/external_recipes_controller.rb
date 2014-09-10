class ExternalRecipesController < ApplicationController

  def index
    @results = Yummly.search('nutella')
  end

end
