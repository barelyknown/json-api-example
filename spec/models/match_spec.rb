RSpec.describe Match do
  it { is_expected.to have_attribute :scheduled_start_at }

  it "has many players" do
    expect(subject.players).to eq []
  end
end
