class Api::V1::RandomInvoicesController < ApplicationController
  include RandomHelper
  respond_to :json
end
