Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  jsonapi_resources :users do
    jsonapi_relationships
  end

  jsonapi_resources :sleeps, except: [:index]
end
