class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :slug, null: false
      t.index :slug
    end
    create_table :queries do |t|
      t.string :query, null: false
      t.integer :search_id, null: false
      t.integer :weighting, null: false

      t.index :search_id
    end
  end
end
