class AddMoreDetailsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :reply_time, :string
  end
end
