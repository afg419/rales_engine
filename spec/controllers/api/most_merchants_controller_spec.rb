require 'rails_helper'

RSpec.describe Api::V1::Revenues::MostMerchantsController, type: :controller do
  it "Gets top merchant by revenue" do
    m1 = Merchant.create(name: "Carl1")
    m2 = Merchant.create(name: "Carl2")
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    item1 = InvoiceItem.new(unit_price: 20000, quantity: 2)
    item2 = InvoiceItem.new(unit_price: 10000, quantity: 2)
    inv1 = Invoice.create(transactions: [t1],
                             merchant: m1,
                        invoice_items: [item1],
                           created_at: "2012-03-16 11:55:05")
    inv2 = Invoice.create(transactions: [t2],
                             merchant: m2,
                        invoice_items: [item2],
                           created_at: "2012-03-16 11:55:05")
    get :index, format: :json, quantity: 1

    expect(response.status).to eq 200
    expect(response.body).to eq "[{\"id\":#{m1.id},\"name\":\"Carl1\",\"revenue\":\"400.0\"}]"
  end

end
