class Api::V1::RandomItemsController < ApplicationController
  include RandomHelper
  respond_to :json
end
