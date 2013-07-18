class RemoveChallengings < ActiveRecord::Migration
  def up
    drop_table :challengings
  end

  def down
    create_table :challengings do |t|
      t.belongs_to :player
      t.belongs_to :challenged
      t.timestamps
    end
  end
end
