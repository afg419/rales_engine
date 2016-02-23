class Api::V1::FoundItemsController < ApplicationController
  include FoundHelper
  respond_to :json

  def show
    find_first(Item, finder_params)
  end

  def index
    find_all(Item, finder_params)
  end

  private

  def finder_params
    params.except("controller", "action", "format")
  end
end
