class AddShippingAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :suburb, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :post_code, :integer
    add_column :users, :country, :string
  end
end
