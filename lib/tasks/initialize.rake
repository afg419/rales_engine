require 'csv'

namespace :initialize do

  desc "TODO"
  task seed_data: :environment do
    customers = CSV.open('./vendor/assets/data/customers.csv', headers: true, header_converters: :symbol)
    invoices = CSV.open('./vendor/assets/data/invoices.csv', headers: true, header_converters: :symbol)
    items = CSV.open('./vendor/assets/data/items.csv', headers: true, header_converters: :symbol)
    merchants = CSV.open('./vendor/assets/data/merchants.csv', headers: true, header_converters: :symbol)
    transactions = CSV.open('./vendor/assets/data/transactions.csv', headers: true, header_converters: :symbol)
    # puts x.first
    puts customers.to_a[0].to_h

    # customers.each do |row|
    #   Customer.create(row.to_h)
    # end
  end

end
