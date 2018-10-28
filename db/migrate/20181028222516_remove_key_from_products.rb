class RemoveKeyFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_index :products, :key
    remove_column :products, :key, :string
  end
end
