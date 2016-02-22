require 'csv'

namespace :initialize do

  desc "TODO"
  task seed_data: :environment do
    data = [[Customer, CSV.open('./vendor/assets/data/customers.csv', headers: true, header_converters: :symbol)],
    [Merchant, CSV.open('./vendor/assets/data/merchants.csv', headers: true, header_converters: :symbol)],
    [Item, CSV.open('./vendor/assets/data/items.csv', headers: true, header_converters: :symbol)],
    [Invoice, CSV.open('./vendor/assets/data/invoices.csv', headers: true, header_converters: :symbol)],
    [Transaction, CSV.open('./vendor/assets/data/transactions.csv', headers: true, header_converters: :symbol)],
    [InvoiceItem, CSV.open('./vendor/assets/data/invoice_items.csv', headers: true, header_converters: :symbol)]]
    # puts x.first
    # puts customers.to_a[0].to_h
    data.each do |file|
      file[1].each do |row|
        file[0].create(row.to_h)
      end
    end
    # customers.each do |row|
    #   Customer.create(row.to_h)
    # end
  end

end
