class AddImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_one, :string
    add_column :products, :image_two, :string
  end
end
