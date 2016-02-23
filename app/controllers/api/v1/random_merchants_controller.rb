class Api::V1::RandomMerchantsController < ApplicationController
  respond_to :json

  def show
    merchants = Merchant.all.shuffle
    respond_with merchants.first
  end

end
