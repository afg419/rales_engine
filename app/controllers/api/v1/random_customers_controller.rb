class Api::V1::RandomCustomersController < ApplicationController
  include RandomHelper
  respond_to :json

  def show
    respond_with random(Customer)
  end
end
