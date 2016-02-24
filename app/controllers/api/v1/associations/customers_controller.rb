class Api::V1::Associations::CustomersController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(Customer.find(params[:id]), params[:association])
  end
end
