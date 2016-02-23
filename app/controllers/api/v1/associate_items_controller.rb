class Api::V1::AssociateItemsController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(Item.find(params[:id]), params[:association])
  end
end
