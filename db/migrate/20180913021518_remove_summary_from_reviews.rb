class RemoveSummaryFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :summary, :string
  end
end
