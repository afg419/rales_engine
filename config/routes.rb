Rails.application.routes.draw do

#do revenue.  scope invoices by successful transactions
#do favorite_customer, favorite_merchant
#best day is hard

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
      resources :merchants

      get "customers/find", to: "found_customers#show"
      get "customers/find_all", to: "found_customers#index"
      get "customers/random", to: "random_customers#show"
      resources :customers
      get "customers/:id/:association", to: "associate_customers#index"

      get "items/find", to: "found_items#show"
      get "items/find_all", to: "found_items#index"
      get "items/random", to: "random_items#show"
      get "items/most_revenue", to: "most_revenue_items#index"
      resources :items
      get "items/:id/:association", to: "associate_items#index"

      get "invoices/find", to: "found_invoices#show"
      get "invoices/find_all", to: "found_invoices#index"
      get "invoices/random", to: "random_invoices#show"
      resources :invoices
      get "invoices/:id/:association", to: "associate_invoices#index"

      get "transactions/find", to: "found_transactions#show"
      get "transactions/find_all", to: "found_transactions#index"
      get "transactions/random", to: "random_transactions#show"
      resources :transactions
      get "transactions/:id/:association", to: "associate_transactions#index"

      get "invoice_items/find", to: "found_invoice_items#show"
      get "invoice_items/find_all", to: "found_invoice_items#index"
      get "invoice_items/random", to: "random_invoice_items#show"
      resources :invoice_items
      get "invoice_items/:id/:association", to: "associate_invoice_items#index"
    end
  end
end
