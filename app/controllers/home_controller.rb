class HomeController < ApplicationController

  layout 'skrollr', only: 'about'

  def index
    expires_in 1.minute, public: true
  end

  def about
    expires_in 1.minute, public: true
  end

end