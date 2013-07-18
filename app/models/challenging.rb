class Challenging < ActiveRecord::Base
  belongs_to :player
  belongs_to :challenged, class_name: 'Player'
end