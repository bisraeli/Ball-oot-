class Game < ActiveRecord::Base
  attr_accessible :challenger_id, :challenger, :end_time, :location, :player_id, :player, :start_time, :zipcode

  belongs_to :player
  belongs_to :challenger, class_name: "Player"

  validates :location, presence: true, on: :save

  validate :end_time_after_start_time, on: :save

  private
  def end_time_after_start_time
    if end_time <= start_time
      errors[:end_time] << "must be after start time"
    end
  end
end
