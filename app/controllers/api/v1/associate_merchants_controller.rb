class Api::V1::AssociateMerchantsController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(Merchant.find(params[:id]), params[:association])
  end
end
