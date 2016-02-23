class Api::V1::AssociateInvoiceItemsController < ApplicationController
  include AssociationHelper

  respond_to :json

  def index
    get_associated(InvoiceItem.find(params[:id]), params[:association])
  end
end
