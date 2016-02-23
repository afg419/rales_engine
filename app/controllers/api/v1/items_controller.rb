class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end
end
