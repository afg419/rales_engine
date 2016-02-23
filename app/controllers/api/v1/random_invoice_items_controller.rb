class Api::V1::RandomInvoiceItemsController < ApplicationController
  include RandomHelper
  respond_to :json
end
