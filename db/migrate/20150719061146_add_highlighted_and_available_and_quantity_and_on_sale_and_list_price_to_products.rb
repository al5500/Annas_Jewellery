class AddHighlightedAndAvailableAndQuantityAndOnSaleAndListPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :hightlighted, :boolean
    add_column :products, :available, :boolean
    add_column :products, :quantity, :integer
    add_column :products, :on_sale, :boolean
    add_column :products, :list_price, :decimal
  end
end
