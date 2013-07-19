class Player < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password


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

  def encrypt_password
    if password.present?
        #This generates a random string that helps me encrypt the password.
        self.password_salt= BCrypt::Engine.generate_salt
        self.password_hash= BCrypt::Engine.hash_secret(password, password_salt)

    end
  end

  #I can call this with User.authenticate(l,p)
  def self.authenticate(email, password)
    #This will auth a user
    player = Player.find_by_email(email)
    if player && player.password_hash == BCrypt::Engine.hash_secret(password, password_salt)
      player
    else
      nil
    end
  end
end
