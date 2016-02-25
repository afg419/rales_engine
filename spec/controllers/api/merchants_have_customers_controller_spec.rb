require 'rails_helper'

RSpec.describe Api::V1::Revenues::MerchantsHaveCustomersController, type: :controller do
  it "Gets revenue for multiple merchants" do
    m1 = Merchant.create(name: "Carl1")
    m2 = Merchant.create(name: "Carl2")
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    c1 = Customer.create(first_name: "Hank1")
    c2 = Customer.create(first_name: "Hank2")
    item1 = InvoiceItem.new(unit_price: 20000, quantity: 2)
    item2 = InvoiceItem.new(unit_price: 10000, quantity: 1)

    inv1 = Invoice.create(transactions: [t1],
                             merchant: m1,
                        invoice_items: [item1],
                           created_at: "2012-03-16 11:55:05",
                           customer: c1)
    inv2 = Invoice.create(transactions: [t2],
                             merchant: m1,
                        invoice_items: [item2],
                           created_at: "2012-03-16 11:55:05",
                           customer: c1)
    get :show, format: :json, id: m1.id

    expect(response.status).to eq 200
    expect(response.body).to eq "{\"id\":#{c1.id}}"
  end

end
