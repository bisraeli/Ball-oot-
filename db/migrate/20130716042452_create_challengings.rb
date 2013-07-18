class CreateChallengings < ActiveRecord::Migration
  def up
    create_table :challengings do |t|
      t.belongs_to :player
      t.belongs_to :challenged
      t.timestamps
    end
  end
  def down
    drop_table :challengings
  end
end
