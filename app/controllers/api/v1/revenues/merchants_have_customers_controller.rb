class Api::V1::Revenues::MerchantsHaveCustomersController < ApplicationController
  respond_to :json

  def index
    merchant = Merchant.find(params[:id])
    respond_with merchant.invoices.pending.map(&:customer_id)
  end


  # GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices


  def show
    merchant = Merchant.find(params[:id])
    customer_totals = merchant.invoices.successful.joins(:customer).group(:customer_id).count
    respond_with ({"id" => customer_totals.sort_by{|k,v| -v}.first[0]})
  end
end
