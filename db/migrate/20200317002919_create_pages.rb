class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :subtitle
      t.string :image_url
      t.text :body
      
      t.timestamps
    end
  end
end
