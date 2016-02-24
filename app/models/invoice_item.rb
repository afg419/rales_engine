class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  before_save :format_price

  def format_price
    self.unit_price = ((unit_price.to_i)/(100.to_f)).round(2).to_s
  end
end
