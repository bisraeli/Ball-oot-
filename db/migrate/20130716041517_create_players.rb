class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :height
      t.float :weight
      t.string :zipcode
      t.string :password_hash
      t.string :password_salt
      t.timestamps
    end
  end
end
