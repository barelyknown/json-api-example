RSpec.describe MatchPlayer do
  it "belongs to a match" do
    expect(subject.build_match).to be_a Match
  end

  it "belongs to a player" do
    expect(subject.build_player).to be_a Player
  end

  it "validates the presence of the match" do
    subject.match = nil
    subject.valid?
    expect(subject.errors[:match]).to include "can't be blank"
  end

  it "validates the presence of the player" do
    subject.player = nil
    subject.valid?
    expect(subject.errors[:player]).to include "can't be blank"
  end
end
