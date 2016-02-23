class Api::V1::RandomItemsController < ApplicationController
  include RandomHelper
  respond_to :json

  def show
    respond_with random(Item)
  end
end
