class Api::V1::FoundMerchantsController < ApplicationController
  include StringFormatter
  respond_to :json

  def show
    if Merchant.first.attributes.include?(finder_params.keys.first)
      respond_with Merchant.find_by(finder_params)
    else
      respond_with ({error: "Parameter does not exist on Merchant's Table"})
    end
  end

  private

  def finder_params
    params.except("controller", "action", "format").map do |k,v|
      [k, capitalize_all(v.downcase)]
    end.to_h
  end
end
