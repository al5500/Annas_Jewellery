class AddPostageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :postage, :decimal
  end
end
