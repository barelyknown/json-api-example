RSpec.describe MatchResource do
  let :creatable_fields do
    [:scheduled_start_at, :players]
  end

  let :fetchable_fields do
    [:id, :scheduled_start_at, :created_at, :updated_at, :players]
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
