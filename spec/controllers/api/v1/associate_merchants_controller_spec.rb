require 'rails_helper'

RSpec.describe Api::V1::AssociateMerchantsController, type: :controller do
  it "Returns items associated to merchant" do
    m = Merchant.create(name: "Merchant1")
    i1 = m.items.create(name: "Item1")
    i2 = m.items.create(name: "Item2")
    get :index, format: :json, id: m.id, association: "items"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)).to eq [{"id" => i1.id}, {"id" => i2.id}]
  end

  it "Returns invoices associated to merchant" do
    m = Merchant.create(name: "Merchant1")
    i1 = m.invoices.create(status: "Status1")
    i2 = m.invoices.create(status: "Status2")
    get :index, format: :json, id: m.id, association: "invoices"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)).to eq [{"id" => i1.id}, {"id" => i2.id}]
  end

  it "Bails if not associated" do
    m = Merchant.create(name: "Merchant1 Merchant")
    get :index, format: :json, id: m.id, association: "FIRE"

    expect(response.status).to eq 200

    expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Table"
  end
end
