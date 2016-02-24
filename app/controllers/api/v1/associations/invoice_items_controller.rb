class Api::V1::Associations::InvoiceItemsController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(InvoiceItem.find(params[:id]), params[:association])
  end
end
