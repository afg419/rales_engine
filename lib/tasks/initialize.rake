require 'csv'

namespace :initialize do

  desc "Seeds database"
  task seed_data: :environment do
    data = [
      [Customer, CSV.open('./vendor/assets/data/customers.csv', headers: true, header_converters: :symbol)],
      [Merchant, CSV.open('./vendor/assets/data/merchants.csv', headers: true, header_converters: :symbol)],
      [Item, CSV.open('./vendor/assets/data/items.csv', headers: true, header_converters: :symbol)],
      [Invoice, CSV.open('./vendor/assets/data/invoices.csv', headers: true, header_converters: :symbol)],
      [InvoiceItem, CSV.open('./vendor/assets/data/invoice_items.csv', headers: true, header_converters: :symbol)]
    ]

    data.each do |file|
      file[1].each do |row|
        puts "#{file[0]}"
        file[0].create(row.to_h)
      end
    end
    
    transactions = CSV.open('./vendor/assets/data/transactions.csv',
    headers: true,
    header_converters: :symbol)
    transactions.each do |row|
      puts "Transaction"
      Transaction.create(row.to_h.except(:credit_card_expiration_date))
    end

  end

end
