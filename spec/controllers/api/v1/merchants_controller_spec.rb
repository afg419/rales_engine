require 'rails_helper'

RSpec.describe Api::V1::Revenues::MerchantsController, type: :controller do
  it "Gets revenue for single merchant" do
    m = Merchant.create(name: "Carl")
    t = Transaction.create(result: "success")
    item = InvoiceItem.create(unit_price: 1000000, quantity: 2)
    inv = Invoice.create(transactions: [t],
                             merchant: m,
                        invoice_items: [item])
    get :show, format: :json, id: m.id

    expect(response.status).to eq 200
    expect(response.body).to eq "{\"revenue\":\"200.0\"}"
  end

  it "Gets revenue for multiple merchants" do
    m1 = Merchant.create(name: "Carl1")
    m2 = Merchant.create(name: "Carl2")
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    item1 = InvoiceItem.new(unit_price: 10000, quantity: 2)
    item2 = InvoiceItem.new(unit_price: 10000, quantity: 2)
    inv1 = Invoice.create(transactions: [t1],
                             merchant: m1,
                        invoice_items: [item1],
                           created_at: "2012-03-16 11:55:05")
    inv2 = Invoice.create(transactions: [t2],
                             merchant: m2,
                        invoice_items: [item2],
                           created_at: "2012-03-16 11:55:05")
    get :index, format: :json, date: "2012-03-16 11:55:05"

    expect(response.status).to eq 200
    expect(response.body).to eq "{\"total_revenue\":\"400.0\"}"
  end

end
