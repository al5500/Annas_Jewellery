class RenameColumnHightlightedToHighlighted < ActiveRecord::Migration
  def change
    rename_column :products, :hightlighted, :highlighted
  end
end
