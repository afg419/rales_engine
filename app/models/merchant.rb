class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.get_revenue(date)
    all.to_a.sum{|x| x.get_revenue(date)}
  end

  def get_revenue(date = nil)
    invoices.successful(date).get_revenue
  end
end
