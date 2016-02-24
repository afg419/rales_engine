class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions


  def self.successful(date = nil)
    successful = joins(:transactions).where(transactions: {result: "success"})
    if date
      successful = successful.where(created_at: date)
    end
    successful
  end
end
