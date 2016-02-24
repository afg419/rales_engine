class Api::V1::Revenue::MerchantsController < ApplicationController
  respond_to :json

  def index
    revenue = Merchant.all.reduce(0) do |acc, merchant|
      acc + merchant.get_revenue(params[:date])
    end
    respond_with ({"total_revenue" => "#{revenue}" })
  end

  def show
    merchant = Merchant.find(params[:id])
    revenue = merchant.get_revenue(params[:date])
    respond_with ({"revenue" => "#{revenue}" })
  end
end
