class Api::V1::RandomMerchantsController < ApplicationController
  include RandomHelper
  respond_to :json
end
