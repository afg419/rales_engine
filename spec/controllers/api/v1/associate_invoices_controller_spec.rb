require 'rails_helper'

RSpec.describe Api::V1::AssociateInvoicesController, type: :controller do
  it "Returns merchant associated to invoice" do
    m = Invoice.create
    m.merchant = Merchant.create
    m.save
    i = m.merchant
    get :index, format: :json, id: m.id, association: "merchant"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["id"]).to eq i.id
  end

  it "Returns customer associated to invoice" do
    m = Invoice.create
    m.customer = Customer.create
    m.save
    i = m.customer
    get :index, format: :json, id: m.id, association: "customer"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["id"]).to eq i.id
  end
end
