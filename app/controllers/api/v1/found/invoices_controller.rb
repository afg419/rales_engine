class Api::V1::Found::InvoicesController < Api::V1::Found::BaseController
  respond_to :json

  def show
    find_first(Invoice, finder_params)
  end

  def index
    find_all(Invoice, finder_params)
  end

  private

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end
end
