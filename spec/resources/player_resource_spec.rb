RSpec.describe PlayerResource do
  let :creatable_fields do
    [:name, :matches]
  end

  let :fetchable_fields do
    [:id, :name, :created_at, :updated_at, :matches]
  end

  subject do
    described_class.new(Player.new)
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
