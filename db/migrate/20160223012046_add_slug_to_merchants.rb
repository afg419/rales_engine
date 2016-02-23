class AddSlugToMerchants < ActiveRecord::Migration
  def change
    add_column :merchants, :slug, :string
  end
end
