class ChangeTransactionCcColumnToString < ActiveRecord::Migration
  def change
    change_column :transactions, :credit_card_number, :string
  end
end