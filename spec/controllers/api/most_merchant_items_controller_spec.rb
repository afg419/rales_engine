require 'rails_helper'

RSpec.describe Api::V1::Revenues::MostMerchantItemsController, type: :controller do
  it "Gets revenue for multiple merchants" do
    m1 = Merchant.create(name: "Carl1")
    m2 = Merchant.create(name: "Carl2")
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    item1 = InvoiceItem.new(unit_price: 20000, quantity: 2)
    item2 = InvoiceItem.new(unit_price: 10000, quantity: 1)

    inv1 = Invoice.create(transactions: [t1],
                             merchant: m1,
                        invoice_items: [item1])
    inv2 = Invoice.create(transactions: [t2],
                             merchant: m2,
                        invoice_items: [item2])
    get :index, format: :json, quantity: 1

    expect(response.status).to eq 200
    expect(response.body).to eq "[{\"id\":#{m1.id},\"name\":\"Carl1\"}]"
  end
end
