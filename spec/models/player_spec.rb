RSpec.describe Player do
  it { is_expected.to have_attribute :name }

  it "validates presence of name" do
    subject.name = nil
    subject.valid?
    expect(subject.errors[:name]).to include "can't be blank"
  end

  it "has many matches" do
    expect(subject.matches).to eq []
  end
end
