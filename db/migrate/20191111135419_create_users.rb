class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :phone_number
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :gender
      t.integer :rating

      t.timestamps
    end
  end
end
