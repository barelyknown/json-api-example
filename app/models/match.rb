class Match < ActiveRecord::Base
  belongs_to :player_one, class_name: "Player"
  belongs_to :player_two, class_name: "Player"

  has_many :match_players
  has_many :players, through: :match_players
end
