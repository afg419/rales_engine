require 'rails_helper'

def controllers_with_models
  [
    [Api::V1::MerchantsController, Merchant],
    [Api::V1::ItemsController, Item],
    [Api::V1::CustomersController, Customer],
    [Api::V1::TransactionsController, Transaction],
    [Api::V1::InvoicesController, Invoice],
    [Api::V1::InvoiceItemsController, InvoiceItem]
  ]
end

controllers_with_models.each do |controller_model|
  RSpec.describe controller_model[0], type: :controller do
  it "Returns all merchants" do
      m1 = controller_model[1].create
      m2 = controller_model[1].create
      get :index, format: :json

      merchant_params = [{"id"=>m1.id,
                          "name"=>"merchant1"},
                         {"id"=>m2.id,
                          "name"=>"merchant2"}]
      expect(response.status).to eq 200
      # expect(JSON.parse(response.body)["merchants"]).to eq merchant_params
    end

    it "Returns specific merchant" do
      m1 = controller_model[1].create
      m2 = controller_model[1].create
      get :show, format: :json, id: m1.id

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)["id"]).to eq m1.id
    end
  end
end
