class Api::V1::Revenues::ItemsBestDayController < ApplicationController
  respond_to :json

  def show
    respond_with "best_day" => Item
                                .find(params[:id])
                                .invoices
                                .successful
                                .group('"invoices"."created_at"')
                                .sum("quantity")
                                .sort_by{|k,v| -v}
                                .first
                                .first
  end
end
