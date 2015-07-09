class MatchResource < BaseResource
  attribute :scheduled_start_at
  has_many :players
end
