class Api::V1::Revenues::MostItemsBySoldController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity].to_i
    top_items =  Invoice
                  .successful
                  .joins(:invoice_items)
                  .limit(quantity)
                  .order("sum(quantity) desc")
                  .group(:item_id)
                  .sum(:quantity)
                  .to_a
                  .map {|id,_| {"id" => id, "name" => Item.find(id).name}}
    respond_with top_items
  end
end
