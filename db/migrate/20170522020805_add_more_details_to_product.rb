class AddMoreDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :experttitle, :string
    add_column :products, :expertname, :string
    add_column :products, :reply_time, :string
  end
end
