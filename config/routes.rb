Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      # resources :items
      get "merchants/find", to: "found_merchants#show"
      get "merchants/find_all", to: "found_merchants#index"
      get "merchants/random", to: "random_merchants#show"
      resources :merchants

      get "customers/find", to: "found_customers#show"
      get "customers/find_all", to: "found_customers#index"
      get "customers/random", to: "random_customers#show"
      resources :customers

      get "items/find", to: "found_items#show"
      get "items/find_all", to: "found_items#index"
      get "items/random", to: "random_items#show"
      resources :items

      # resources :customers
    end
  end
end
