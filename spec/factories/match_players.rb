FactoryGirl.define do
  factory :match_player do
    association :match, strategy: :build
    association :player, strategy: :build
  end
end
