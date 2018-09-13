class AddKeyToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :key, :string
    add_index :products, :key, unique: true
  end
end
