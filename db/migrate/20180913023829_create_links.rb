class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.text :url, null: false
      t.string :title, null: false
      t.string :price, null: false
      t.string :brand_image, null: false
      t.integer :product_id, null: false
    end
  end
end
