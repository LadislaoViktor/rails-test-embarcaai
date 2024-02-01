Rails.application.routes.draw do
  get '/cities/search/', to: 'cities#search'
  resources :cities
  resources :states
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
