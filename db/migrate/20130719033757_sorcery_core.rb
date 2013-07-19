class SorceryCore < ActiveRecord::Migration
  def self.up
    add_column :players, :crypted_password, :string, :default => :nil
    add_column :players, :salt, :string, :default => :nil

    remove_column :players, :password_hash
    remove_column :players, :password_salt
  end

  def self.down
    remove_column :players, :crypted_password
    remove_column :players, :salt
  end
end