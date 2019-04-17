class AddRpcToOptimisedQueries < ActiveRecord::Migration[5.2]
  def change
    add_column :optimised_queries, :rpc, :float
    add_column :optimised_queries, :rpi, :float
    add_column :optimised_queries, :clicks, :integer
    add_column :optimised_queries, :impressions, :integer
  end
end
