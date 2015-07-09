class MatchPlayer < ActiveRecord::Base
  belongs_to :match
  belongs_to :player

  validates :match, presence: true
  validates :player, presence: true
end
