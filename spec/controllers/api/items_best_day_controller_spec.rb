require 'rails_helper'

RSpec.describe Api::V1::Revenues::ItemsBestDayController, type: :controller do
  it "Gets the day with the most sales" do
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "failed")
    item = Item.create

    invit1 = InvoiceItem.new(unit_price: 20000, quantity: 2, item: item)
    invit2 = InvoiceItem.new(unit_price: 10000, quantity: 1, item: item)

    inv1 = Invoice.create(transactions: [t1],
                        invoice_items: [invit1],
                           created_at: "2012-03-16 11:56:05")
    inv2 = Invoice.create(transactions: [t2],
                        invoice_items: [invit2],
                           created_at: "2012-03-16 11:54:05")
    get :show, id: item.id, format: :json

    expect(response.status).to eq 200
    expect(response.body).to eq "{\"best_day\":\"2012-03-16T11:56:05.000Z\"}"
  end
end
