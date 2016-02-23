class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    render json: Customer.all
  end

  def show
    respond_with Customer.find(params[:id])
  end
end
