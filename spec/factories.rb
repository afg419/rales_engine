FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number 1
    credit_card_expiration_date "MyString"
    result "MyString"
  end
  factory :invoice_item do
    item nil
    invoice nil
    quantity 1
    unit_price 1
  end
  factory :invoice do
    customer nil
    merchant nil
    status "MyString"
  end
  factory :item do
    name "MyString"
    description "MyString"
    unit_price 1
    merchant nil
  end
  factory :merchant do
    name "MyString"
  end
  factory :customer do
    first_name "MyString"
    last_name "MyString"
  end
end