class Api::V1::RandomMerchantsController < ApplicationController
  include RandomHelper
  respond_to :json

  def show
    respond_with random(Merchant)
  end
end
