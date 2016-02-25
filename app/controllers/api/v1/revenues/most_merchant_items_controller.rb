class Api::V1::Revenues::MostMerchantItemsController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity]
    respond_with Invoice
                  .successful
                  .joins(:invoice_items)
                  .limit(quantity)
                  .order("sum(quantity) desc")
                  .group(:merchant_id)
                  .sum(:quantity)
                  .map{|k,v| {"id" => k, "name" => Merchant.find(k).name}}
  end
end
