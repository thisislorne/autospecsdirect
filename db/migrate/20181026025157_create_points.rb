class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.string :point
      t.integer :product_id, null: false
    end
  end
end
