class Api::V1::FoundMerchantsController < ApplicationController
  include FoundHelper
  respond_to :json

  def show
    find_first(Merchant, finder_params)
  end

  def index
    find_all(Merchant, finder_params)
  end

  private

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end

  def serializer_for(finder_params)
  end
end
