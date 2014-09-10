Rails.application.routes.draw do
  get 'home/index'
  resources :external_recipes, only: :index
end
