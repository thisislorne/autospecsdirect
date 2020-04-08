class AddPVal < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :p_val, :integer, default: 2
  end
end
