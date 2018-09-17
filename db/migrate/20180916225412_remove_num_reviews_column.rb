class RemoveNumReviewsColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :num_reviews, :string
  end
end
