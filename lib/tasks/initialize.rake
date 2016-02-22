require 'csv'

namespace :initialize do

  desc "TODO"
  task seed_data: :environment do
    x = CSV.open('./vendor/assets/data/customers.csv', headers: true, header_converters: :symbol)
    # puts x.first
    puts x.to_a[0].to_h
  end

end
