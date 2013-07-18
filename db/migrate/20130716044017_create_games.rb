class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.string :zipcode
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :player_id
      t.integer :challenger_id

      t.timestamps
    end
  end
end
