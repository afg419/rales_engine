require 'rails_helper'

RSpec.describe Api::V1::RandomMerchantsController, type: :controller do
  it "Returns random merchant" do
    Merchant.create(name: "merchant1")
    Merchant.create(name: "merchant2")
    get :show, format: :json

    expect(response.status).to eq 200
  end
end
