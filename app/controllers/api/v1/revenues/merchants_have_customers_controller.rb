class Api::V1::Revenues::MerchantsHaveCustomersController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.invoices.pending.map(&:customer_id)
  end

  def show
    customer = Merchant.find(params[:id])
                .invoices
                .successful
                .group(:customer)
                .order(count: :desc)
                .count
                .first
                .first
    respond_with ({"id" => customer.id})
  end
end
