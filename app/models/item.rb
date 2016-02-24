class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_save :format_price

  def get_revenue(date)
    invoices.successful(date).reduce(0) do |acc, invoice|
      acc + invoice.get_revenue_for_item(self)
    end.round(2)
  end

  # def get_revenue(date)
  #   invoice_items.successful(date).reduce(0) do |acc, invoice_item|
  #     acc + invoice_item.quantity * unit_price.to_f
  #   end.round(2)
  # end
  #
  # def get_revenue(date)
  #   invoices.successful(date).map{|invoice| invoice.invoice_items}.reduce(0) do |acc, invoice_items|
  #     acc + invoice_item.quantity * unit_price.to_f
  #   end
  # end

  def format_price
    self.unit_price = (unit_price.to_i/(100.to_f)).round(2).to_s
  end
end
