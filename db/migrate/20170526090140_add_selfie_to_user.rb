class AddSelfieToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users , :selfie, :string
  end
end
