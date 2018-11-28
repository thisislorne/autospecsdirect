class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :header, null: false
      t.string :content, null: false
      t.integer :product_id, null: false
    end
  end
end
