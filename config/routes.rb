Rails.application.routes.draw do

  namespace :api do
    namespace :v1, defaults: {format: :json} do
      resources :merchants, only:[:index, :show] do
        collection do
          get "/find", to: "found/merchants#show"
          get "/find_all", to: "found/merchants#index"
          get "/random", to: "random/merchants#show"
          get "/revenue", to: "revenue/merchants#index"
          get "/most_revenue", to: "revenue/most_merchants#index"
        end

        member do
          get "/revenue", to: "revenue/merchants#show"
          get "/:association", to: "associations/merchants#index"
        end
      end

      resources :customers, only:[:index, :show] do
        collection do
          get "/find", to: "found/customers#show"
          get "/find_all", to: "found/customers#index"
          get "/random", to: "random/customers#show"
        end
        member do
          get "/:association", to: "associations/customers#index"
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get "/find", to: "found/items#show"
          get "/find_all", to: "found/items#index"
          get "/random", to: "random/items#show"
          get "/most_revenue", to: "most_revenue_items#index"
        end
        member do
          get "/:association", to: "associations/items#index"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "/find", to: "found/invoices#show"
          get "/find_all", to: "found/invoices#index"
          get "/random", to: "random/invoices#show"
        end
        member do
          get "/:association", to: "associations/invoices#index"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "transactions/find", to: "found/transactions#show"
          get "transactions/find_all", to: "found/transactions#index"
          get "transactions/random", to: "random/transactions#show"
        end

        member do
          get "transactions/:id/:association", to: "associations/transactions#index"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "invoice_items/find", to: "found/invoice_items#show"
          get "invoice_items/find_all", to: "found/invoice_items#index"
          get "invoice_items/random", to: "random/invoice_items#show"
        end
        member do
          get "invoice_items/:id/:association", to: "associations/invoice_items#index"
        end
      end
    end
  end
end

#do revenue.  scope invoices by successful transactions
#do favorite_customer, favorite_merchant
#best day is hard
