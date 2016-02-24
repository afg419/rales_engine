require 'rails_helper'

def random_controllers_with_models
  [
    [Api::V1::Random::MerchantsController, Merchant],
    [Api::V1::RandomItemsController, Item],
    [Api::V1::RandomCustomersController, Customer],
    [Api::V1::RandomTransactionsController, Transaction],
    [Api::V1::RandomInvoicesController, Invoice],
    [Api::V1::RandomInvoiceItemsController, InvoiceItem]
  ]
end

random_controllers_with_models.each do |controller_model|
  RSpec.describe controller_model[0], type: :controller do
    it "Returns random merchant" do
      m1 = controller_model[1].create
      m2 = controller_model[1].create
      ids = [m1.id, m2.id]
      get :show, format: :json

      expect(response.status).to eq 200
      expect(ids.include?(JSON.parse(response.body)["id"]))
    end
  end
end
