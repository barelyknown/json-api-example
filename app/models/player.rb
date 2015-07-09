class Player < ActiveRecord::Base
  validates :name, presence: true

  has_many :match_players
  has_many :matches, through: :match_players
end
