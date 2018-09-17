class RemoveBrandImageFromLinks < ActiveRecord::Migration[5.2]
  def change
    remove_column :links, :brand_image, :string
  end
end
