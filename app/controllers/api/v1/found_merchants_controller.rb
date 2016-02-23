class Api::V1::FoundMerchantsController < ApplicationController
  include StringFormatter
  respond_to :json

  def show
    finder_params = params.except("controller", "action", "format").map do |k,v|
      [k, capitalize_all(v)]
    end.to_h
    respond_with Merchant.find_by(finder_params)
  end

  private

  def finder_params
    params.permit(:all)
  end
end
