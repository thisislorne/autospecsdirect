class DropPointsTableAndAddPointsFieldToProducts < ActiveRecord::Migration[5.2]
  def change
    drop_table :points
    add_column :products, :points, :text
  end
end
