class Api::V1::RevenueMerchantsController < ApplicationController
  respond_to :json

  def index
    revenue = Merchant.all.reduce(0) do |acc, merchant|
      acc + get_revenue_for_merchant(merchant)
    end

    respond_with ({"total_revenue" => "#{revenue}" })
  end

  def show
    merchant = Merchant.find(params[:id])
    revenue = get_revenue_for_merchant(merchant)
    respond_with ({"revenue" => "#{revenue}" })
  end

  private

  def get_revenue_for_merchant(merchant)
    merchant.invoices.successful(params[:date]).reduce(0) do |acc, invoice|
      acc + get_revenue(invoice)
    end.round(2)
  end

  def get_revenue(invoice)
    invoice.invoice_items.reduce(0) do |acc, item|
      acc + item.unit_price.to_f * item.quantity
    end
  end
end
