class SorceryCore < ActiveRecord::Migration
  def self.change
    add_column :players, :crypted_password, :string, :default => :nil
    add_column :players, :salt, :string, :default => :nil

  end

end