class Api::V1::Random::BaseController < ApplicationController
  respond_to :json

  def show
    render json: random(model)
  end

private

  def model
    controllers_model("random")[params[:controller]]
  end

  def random(class_name)
    class_name.all.shuffle.first
  end
end
