class Api::V1::Associations::MerchantsController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(Merchant.find(params[:id]), params[:association])
  end
end
