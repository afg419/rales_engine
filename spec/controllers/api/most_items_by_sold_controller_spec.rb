require 'rails_helper'

RSpec.describe Api::V1::Revenues::MostItemsBySoldController, type: :controller do
  it "Gets top items by total revenue" do
    item1 = Item.create(name: "Wrench")
    item2 = Item.create(name: "Hammer")
    iteminv1 = InvoiceItem.new(unit_price: 20000, quantity: 1, item: item1)
    iteminv2 = InvoiceItem.new(unit_price: 10000, quantity: 2, item: item2)
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "success")
    inv1 = Invoice.create(transactions: [t1],
                        invoice_items: [iteminv1])

    inv2 = Invoice.create(transactions: [t2],
                        invoice_items: [iteminv2])
    get :index, format: :json, quantity: 1

    expect(response.status).to eq 200
    expect(response.body).to eq  "[{\"id\":#{item2.id},\"name\":\"Hammer\"}]"
  end

end
