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

  def index
    if Merchant.first.attributes.include?(finder_params.keys.first)
      respond_with Merchant.where(finder_params).to_a
    else
      respond_with ({error: "Parameter does not exist on Merchant's Table"})
    end
  end

  private

  def finder_params
    merchant_name = Merchant.pluck(:name)
    params.except("controller", "action", "format").map do |k,v|
      if k == "name"
        ["slug", v.parameterize]
      else
        [k,v]
      end
    end.to_h
  end
end
