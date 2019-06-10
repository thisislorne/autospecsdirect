class AddAdgroupIDs < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :adgroup_ids, :text, array: true, default: []
  end
end
