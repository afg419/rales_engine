class Api::V1::AssociateInvoicesController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(Invoice.find(params[:id]), params[:association])
  end
end
