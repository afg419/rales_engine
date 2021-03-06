class Api::V1::Revenues::MerchantsController < ApplicationController
  respond_to :json

  def index
    revenue = Merchant.get_revenue(params[:date])
    respond_with ({"total_revenue" => "#{revenue}" })
  end

  def show
    merchant = Merchant.find(params[:id])
    revenue = merchant.get_revenue(params[:date])
    respond_with ({"revenue" => "#{revenue}" })
  end
end
