class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_save :format_price

  def format_price
    self.unit_price = ((unit_price.to_i)/(100.to_f))
  end
end
