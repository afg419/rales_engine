require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  it "Returns all merchants" do
    Merchant.create(name: "merchant1")
    Merchant.create(name: "merchant2")
    get :index, format: :json

    merchant_params = [{"id"=>1,
                        "name"=>"merchant1"},
                       {"id"=>2,
                        "name"=>"merchant2"}]
    expect(response.status).to eq 200
    # expect(JSON.parse(response.body)["merchants"]).to eq merchant_params
  end
end
