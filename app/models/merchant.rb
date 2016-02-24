class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def get_revenue(date)
    invoices.successful(date).reduce(0) do |acc, invoice|
      acc + invoice.get_revenue
    end.round(2)
  end
end
