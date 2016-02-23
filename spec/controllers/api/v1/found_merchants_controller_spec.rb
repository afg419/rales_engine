require 'rails_helper'

RSpec.describe Api::V1::FoundMerchantsController, type: :controller do
  it "Returns merchant by id" do
    m1 = Merchant.create(name: "Merchant1")
    m2 = Merchant.create(name: "Merchant2")
    get :show, format: :json, id: m1.id

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["name"]).to eq m1.name
  end

  it "Returns merchant by name" do
    m1 = Merchant.create(name: "Merchant1")
    m2 = Merchant.create(name: "Merchant2")
    get :show, format: :json, name: m1.name

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["name"]).to eq m1.name
  end

  it "Returns merchant by name multi-cased multi-worded" do
    m1 = Merchant.create(name: "Merchant1 Merchant")
    m2 = Merchant.create(name: "Merchant2")
    get :show, format: :json, name: "Merchant1 merchant"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["name"]).to eq m1.name
  end

  it "Bails if finding by non column param" do
    m1 = Merchant.create(name: "Merchant1 Merchant")
    m2 = Merchant.create(name: "Merchant2")
    get :show, format: :json, fame: "Merchant1 merchant"

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["error"]).to eq "Parameter does not exist on Merchant's Table"
  end
end
