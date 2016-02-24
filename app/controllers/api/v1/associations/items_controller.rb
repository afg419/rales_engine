class Api::V1::Associations::ItemsController < Api::V1::Associations::BaseController
  respond_to :json

  def index
    get_associated(Item.find(params[:id]), params[:association])
  end
end
