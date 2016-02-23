class Api::V1::AssociateTransactionsController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(Transaction.find(params[:id]), params[:association])
  end
end
