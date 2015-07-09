RSpec.describe MatchPlayerResource do
  let :creatable_fields do
    [:match, :player]
  end

  let :fetchable_fields do
    [:id, :match, :player, :created_at, :updated_at]
  end

  subject do
    described_class.new(Match.new)
  end

  it "has the correct set of creatable fields" do
    expect(described_class.creatable_fields(nil).sort).to eq creatable_fields.sort
  end

  it "has the correct set of updatable fields" do
    expect(described_class.updatable_fields(nil).sort).to eq creatable_fields.sort
  end

  it "has the correct set of fetchable fields" do
    expect(subject.fetchable_fields.sort).to eq fetchable_fields.sort
  end
end
