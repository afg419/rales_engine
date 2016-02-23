require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  it "Returns all merchants" do
    m1 = Merchant.create(name: "merchant1")
    m2 = Merchant.create(name: "merchant2")
    get :index, format: :json

    merchant_params = [{"id"=>m1.id,
                        "name"=>"merchant1"},
                       {"id"=>m2.id,
                        "name"=>"merchant2"}]
    expect(response.status).to eq 200
    # expect(JSON.parse(response.body)["merchants"]).to eq merchant_params
  end

  it "Returns specific merchant" do
    m1 = Merchant.create(name: "merchant1")
    m2 = Merchant.create(name: "merchant2")
    get :show, format: :json, id: m1.id

    expect(response.status).to eq 200
    expect(JSON.parse(response.body)["name"]).to eq m1.name
  end
end
