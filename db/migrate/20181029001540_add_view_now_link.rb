class AddViewNowLink < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :view_now_link, :string
  end
end
