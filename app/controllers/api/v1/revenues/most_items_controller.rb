class Api::V1::Revenues::MostItemsController < ApplicationController
  respond_to :json

  def index
    quantity = params[:quantity].to_i
    result = Invoice
                .successful
                .joins(:invoice_items)
                .limit(quantity)
                .order("sum(unit_price * quantity) desc")
                .group(:item_id)
                .sum("unit_price * quantity")
                .to_a
                .map{|id,_| {"id" => id, "name" => Item.find(id).name} }
    respond_with result
  end
end
