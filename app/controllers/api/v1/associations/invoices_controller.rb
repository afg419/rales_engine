class Api::V1::Associations::InvoicesController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(Invoice.find(params[:id]), params[:association])
  end
end
