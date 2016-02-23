class Api::V1::RandomCustomersController < ApplicationController
  include RandomHelper
  respond_to :json
end
