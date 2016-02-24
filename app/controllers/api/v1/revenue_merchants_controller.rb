class Api::V1::RevenueMerchantsController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])
    revenue = merchant.invoices.reduce(0) do |acc, invoice|
      acc + invoice.invoice_items.reduce(0) do |acc, inv_item|
        acc + inv_item.unit_price.to_f
      end
    end

    respond_with ({"revenue" => "#{revenue}" })
  end
end
