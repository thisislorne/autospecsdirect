class AddMoreFieldsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :text
    add_column :products, :version_number, :string
    add_column :products, :app_name, :string
    add_column :products, :mac, :boolean
    add_column :products, :windows, :boolean
    add_column :products, :file_name_mac, :string
    add_column :products, :file_name_windows, :string
  end
end
