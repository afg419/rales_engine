class Api::V1::Found::ItemsController < Api::V1::Found::BaseController
  respond_to :json

  def show
    find_first(Item, finder_params)
  end

  def index
    find_all(Item, finder_params)
  end

  private

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end
end
