class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :image
      t.string :brand
      t.text :brand_image
      t.string :rating
      t.string :num_reviews
    end
  end
end
