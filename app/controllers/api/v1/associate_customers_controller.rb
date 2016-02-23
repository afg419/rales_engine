class Api::V1::AssociateCustomersController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(Customer.find(params[:id]), params[:association])
  end
end
