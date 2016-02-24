class Api::V1::Associations::BaseController < ApplicationController
  respond_to :json

  def index
    get_associated(model.find(params[:id]), params[:association])
  end

private

  def model
    controllers_model("associations")[params[:controller]]
  end

  def get_associated(object, association_query)
    if object.respond_to?(association_query)
      respond_with object.send(association_query)
    else
      respond_with ({error: "Parameter does not exist on Table"})
    end
  end
end
