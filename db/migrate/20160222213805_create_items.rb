class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :unit_price
      t.references :merchant, index: true, foreign_key: true
      t.string :created_at
      t.string :updated_at

    end
  end
end
