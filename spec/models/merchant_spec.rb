require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it "gets revenue for single merchant" do
    m = Merchant.create(name: "Carl")
    t = Transaction.create(result: "success")
    item = InvoiceItem.create(unit_price: 1000000, quantity: 2)
    inv = Invoice.create(transactions: [t],
                             merchant: m,
                        invoice_items: [item])

    expect(200.00).to eq m.get_revenue.to_f
  end

  it "gets revenue for multiple merchants" do
    m1 = Merchant.create(name: "Carl1")
    m2 = Merchant.create(name: "Carl2")
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    item1 = InvoiceItem.create(unit_price: 1000000, quantity: 2)
    item2 = InvoiceItem.create(unit_price: 1000000, quantity: 2)
    inv1 = Invoice.create(transactions: [t1],
                             merchant: m1,
                        invoice_items: [item1],
                           created_at: "2012-03-16 11:55:05")
    inv2 = Invoice.create(transactions: [t2],
                             merchant: m2,
                        invoice_items: [item2],
                           created_at: "2012-03-16 11:55:05")
    expect(400.00).to eq Merchant.get_revenue("2012-03-16 11:55:05")
  end
end
