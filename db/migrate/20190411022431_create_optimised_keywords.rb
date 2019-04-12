class CreateOptimisedKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :optimised_queries do |t|
      t.integer :query_id, null: false
      t.integer :weighting, null: false
      t.string :adgroup_id, null: false
    end
    add_column :queries, :optimisation_enabled, :boolean, default: true
    add_column :queries, :enabled, :boolean, default: true
    add_column :searches, :optimisation_enabled, :boolean, default: true
    add_column :queries, :query_stripped, :string

    # Query.all.each do |q|
    #   q.query_stripped = q.query.downcase.gsub(/\s+/, "").gsub("'", '')
    #   q.save!
    # end
  end
end
