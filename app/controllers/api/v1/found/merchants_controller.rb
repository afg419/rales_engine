class Api::V1::Found::MerchantsController < Api::V1::Found::BaseController
  respond_to :json

  def show
    find_first(Merchant, finder_params)
  end

  def index
    find_all(Merchant, finder_params)
  end
end
