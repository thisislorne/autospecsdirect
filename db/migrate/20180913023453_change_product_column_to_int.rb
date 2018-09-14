class ChangeProductColumnToInt < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :product
    add_column :reviews, :product_id, :integer
  end
end
