class ChangeProductColumnToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :product, :integer
    rename_column :reviews, :product, :product_id
  end
end
