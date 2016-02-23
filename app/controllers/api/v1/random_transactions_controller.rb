class Api::V1::RandomTransactionsController < ApplicationController
  include RandomHelper
  respond_to :json
end
