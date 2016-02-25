require 'rails_helper'

RSpec.describe Api::V1::Associations::MerchantsController, type: :controller do
  it "Returns items associated to merchant" do
    m = Merchant.create(name: "Merchant1")
    i1 = m.items.create(name: "Item1", unit_price: 10000, description: "desc1")
    i2 = m.items.create(name: "Item2", unit_price: 20000, description: "desc2")
    get :index, format: :json, id: m.id, association: "items"

    expect(response.status).to eq 200

    reply = JSON.parse(response.body)

    ids = reply.map{|item| item["id"]}
    expect(ids).to eq [i1.id, i2.id]

    names = reply.map{|item| item["name"]}
    expect(names).to eq [i1.name, i2.name]

    unit_prices = reply.map{|item| item["unit_price"]}
    expect(unit_prices).to eq [i1.unit_price.to_s, i2.unit_price.to_s]

    descriptions = reply.map{|item| item["description"]}
    expect(descriptions).to eq [i1.description, i2.description]
  end

  it "Returns invoices associated to merchant" do
    m = Merchant.create(name: "Merchant1")
    i1 = m.invoices.create(status: "Status1")
    i2 = m.invoices.create(status: "Status2")
    get :index, format: :json, id: m.id, association: "invoices"

    expect(response.status).to eq 200
    reply = JSON.parse(response.body)

    ids = reply.map{|item| item["id"]}
    expect(ids).to eq [i1.id, i2.id]

    statuses = reply.map{|item| item["status"]}
    expect(statuses).to eq [i1.status, i2.status]
  end

  it "Bails if not associated" do
    m = Merchant.create(name: "Merchant1 Merchant")
    get :index, format: :json, id: m.id, association: "FIRE"

    expect(response.status).to eq 200

    expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Table"
  end
end
