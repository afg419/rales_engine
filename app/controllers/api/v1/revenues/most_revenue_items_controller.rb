class Api::V1::Revenues::MostItemsController < ApplicationController
  respond_to :json

  def index
    items = Item.all.map do |item|
      {'id' => item.id, 'name' => item.name, 'revenue' => item.get_revenue(params[:date])}
    end

    items.sort_by! do |item|
      - item['revenue']
    end

    respond_with items[0..(params[:quantity].to_i - 1)]
  end

  def index

  end
end
