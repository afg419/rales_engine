require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "computes pending invoices" do
    t1 = Transaction.create(result: "success")
    t2 = Transaction.create(result: "failed")
    i1 = Invoice.create(transactions: [t1]).id
    i2 = Invoice.create(transactions: [t2]).id
    i3 = Invoice.create.id

    expected = [i2, i3]
    computed = Invoice.pending.map(&:id)
    expect(expected).to eq computed
  end
end
