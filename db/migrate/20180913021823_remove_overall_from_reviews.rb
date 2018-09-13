class RemoveOverallFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :overall, :string
  end
end
