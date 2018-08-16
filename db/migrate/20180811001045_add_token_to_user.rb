class AddTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :access_token, :string
    add_index :users, :access_token, unique: true
  end
end
