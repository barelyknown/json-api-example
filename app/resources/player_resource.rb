class PlayerResource < BaseResource
  attribute :name
  has_many :matches

  filter :id
end
