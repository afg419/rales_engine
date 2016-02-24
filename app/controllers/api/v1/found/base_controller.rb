class Api::V1::Found::BaseController < ApplicationController
  include FoundService
  respond_to :json

  def show
    find_first(model, finder_params)
  end

  def index
    find_all(model, finder_params)
  end

private

  def model
    controllers_model("found")[params[:controller]]
  end

  def finder_params
    params.permit!
    params.except("controller", "action", "format")
  end
end
