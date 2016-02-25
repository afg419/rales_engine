Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :merchants, only:[:index, :show] do
        collection do
          get "/find", to: "finders/merchants#show"
          get "/find_all", to: "finders/merchants#index"
          get "/random", to: "randoms/merchants#show"
          get "/revenue", to: "revenues/merchants#index"
          get "/most_revenue", to: "revenues/most_merchants#index"
          get "/most_items", to: "revenues/most_merchant_items#index"
        end
        member do
          get "/revenue", to: "revenues/merchants#show"
          get '/favorite_customer', to: "revenues/merchants_have_customers#show"
          get '/customers_with_pending_invoices', to: "revenues/merchants_have_customers#index"
          get "/:association", to: "associations/merchants#index"
        end
      end

      resources :customers, only:[:index, :show] do
        collection do
          get "/find", to: "finders/customers#show"
          get "/find_all", to: "finders/customers#index"
          get "/random", to: "randoms/customers#show"
        end
        member do
          get "/favorite_merchant", to: "revenues/customer_has_merchants#show"
          get "/:association", to: "associations/customers#index"
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get "/find", to: "finders/items#show"
          get "/find_all", to: "finders/items#index"
          get "/random", to: "randoms/items#show"
          get "/most_revenue", to: "revenues/most_items#index"
          get "/most_items", to: "revenues/most_items_by_sold#index"
        end
        member do
          get "/best_day", to: "revenues/items_best_day#show"
          get "/:association", to: "associations/items#index"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "/find", to: "finders/invoices#show"
          get "/find_all", to: "finders/invoices#index"
          get "/random", to: "randoms/invoices#show"
        end
        member do
          get "/:association", to: "associations/invoices#index"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "/find", to: "finders/transactions#show"
          get "/find_all", to: "finders/transactions#index"
          get "/random", to: "randoms/transactions#show"
        end
        member do
          get "/:association", to: "associations/transactions#index"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "/find", to: "finders/invoice_items#show"
          get "/find_all", to: "finders/invoice_items#index"
          get "/random", to: "randoms/invoice_items#show"
        end
        member do
          get "/:association", to: "associations/invoice_items#index"
        end
      end
    end
  end
end

#do revenue.  scope invoices by successful transactions
#do favorite_customer, favorite_merchant
#best day is hard
