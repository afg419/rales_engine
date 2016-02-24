class Api::V1::Revenues::CustomerHasMerchantsController < ApplicationController
  respond_to :json

  def show
    merchant = Customer.find(params[:id])
                        .invoices
                        .successful
                        .group(:merchant)
                        .order(count: :desc)
                        .count
                        .first
                        .first
    respond_with ({"id" => merchant.id, "name" => merchant.name})
  end
end
