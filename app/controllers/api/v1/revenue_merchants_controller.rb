class Api::V1::RevenueMerchantsController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])

    revenue = merchant.invoices.successful(params[:date]).reduce(0) do |acc, invoice|
      acc + get_revenue(invoice)
    end.round(2)

    respond_with ({"revenue" => "#{revenue}" })
  end

  private

  def get_revenue(invoice)
    invoice.invoice_items.reduce(0) do |acc, item|
      acc + item.unit_price.to_f * item.quantity
    end
  end
end
