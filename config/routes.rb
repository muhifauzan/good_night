Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  jsonapi_resources :users do
    jsonapi_links :sleeps
    jsonapi_related_resources :sleeps

    jsonapi_links :followees
    jsonapi_related_resources :followees

    jsonapi_resources :followees_sleeps, only: [:index]
  end

  jsonapi_resources :sleeps, except: [:index]
end
