class AddOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :order, :integer
  end
end
