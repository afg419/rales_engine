class Api::V1::RandomMerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.all.shuffle.first
  end
end
