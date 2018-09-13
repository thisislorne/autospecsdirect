class AddSummaryBackToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :summary, :string
  end
end
