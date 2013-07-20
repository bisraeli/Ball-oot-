class Player < ActiveRecord::Base
  authenticates_with_sorcery!

  include Gravtastic
  gravtastic :filetype => :gif, :rating => "PG", :default => "identicon"

  has_many :games
  has_many :challengers, :through => :games, source: 'challenger'
  attr_accessible :firstname, :lastname, :email, :height, :weight, :zipcode, :email, :password, :password_confirmation

  validates :password, confirmation: true
  validates :password, presence: true, on: :create
  validates :firstname, :lastname, length: { in: 2..50 }

  validates :firstname, :lastname, :email, presence: true
  validates :email, uniqueness: true

  validates :height, format: { with: /\A[4-8]'[0-9][0-9]?\z/,
    message: "should be in the form of 5'9" }

  validates :weight, numericality: { in: 80..300 }

  def display_name
    "#{self.firstname} #{self.lastname}"
  end
end
