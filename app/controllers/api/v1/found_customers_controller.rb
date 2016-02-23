class Api::V1::FoundCustomersController < ApplicationController
  include FoundHelper
  respond_to :json

  def show
    find_first(Customer, finder_params)
  end

  def index
    find_all(Customer, finder_params)
  end

  private

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end
end
