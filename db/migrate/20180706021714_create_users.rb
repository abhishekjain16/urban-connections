class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :username
      t.string :email
      t.boolean :status, default: true
      t.string :type
      t.string :gender
      t.string :phone
      t.string :designation
      t.string :age
      t.timestamps
    end
  end
end
