Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      # resources :items
      get "merchants/find", to: "found_merchants#show"
      get "merchants/find_all", to: "found_merchants#index"
      get "merchants/random", to: "random_merchants#show"
      resources :merchants
      # resources :customers
    end
  end
end
