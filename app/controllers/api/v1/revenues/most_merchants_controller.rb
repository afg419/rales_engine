class Api::V1::Revenues::MostMerchantsController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity]
    respond_with Invoice
                  .successful
                  .joins(:invoice_items)
                  .limit(quantity)
                  .order("sum(unit_price * quantity) desc")
                  .group(:merchant_id)
                  .sum("unit_price * quantity")
                  .map{|k,v| {"id" => k, "name" => Merchant.find(k).name, "revenue" => v}}
  end
end
