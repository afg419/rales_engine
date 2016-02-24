class Api::V1::Found::InvoiceItemsController < Api::V1::Found::BaseController
  respond_to :json

  def show
    find_first(InvoiceItem, finder_params)
  end

  def index
    find_all(InvoiceItem, finder_params)
  end

  private

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end
end
