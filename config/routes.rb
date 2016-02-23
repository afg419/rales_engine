Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      # resources :items
      get "merchants/find", to: "found_merchants#show"
      get "merchants/random", to: "random_merchants#show"
      resources :merchants
      # resources :customers
    end
  end
end
