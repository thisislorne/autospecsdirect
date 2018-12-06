class AddFileSizeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :file_size, :string
  end
end
