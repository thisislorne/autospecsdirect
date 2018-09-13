class RemoveUneededFieldsFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :formula
    remove_column :reviews, :effectiveness
    add_column :reviews, :summary, :string
  end
end
