class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :user, null: false
      t.string :rating, null: false
      t.string :review, null: false
      t.string :overall, null: false
      t.string :flavour, null: false
      t.string :formula, null: false
      t.string :effectiveness, null: false
      t.string :product, null: false
    end
  end
end
