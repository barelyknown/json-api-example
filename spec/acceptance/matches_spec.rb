require "api_documentation_helper"

RSpec.resource "Matches" do
  header "Content-Type", "application/vnd.api+json"

  post "/matches" do
    parameter :type, <<-DESC, required: true
      Should always be set to <code>matches</code>.
    DESC

    parameter "scheduled-start-at", <<-DESC, scope: :attributes
      The scheduled start time.
    DESC

    parameter "players", <<-DESC, scope: :relationships
      The players assigned to the match.
    DESC

    let(:type) { :matches }

    let("scheduled-start-at") { DateTime.new(2015,7,9,6,30) }

    let(:players) do
      p1 = FactoryGirl.create(:player, name: "Sean Devine")
      p2 = FactoryGirl.create(:player, name: "Peter Coumounduros")
      { data: [{id: p1.id, type: "players"}, {id: p2.id, type: "players"}] }
    end

    example_request "Create a match" do
      expect(status).to eq 201
    end
  end

  get "/matches/:id" do
    parameter :id, <<-DESC, required: true
      ID of the match to be retrieved.
    DESC

    let(:id) do
      FactoryGirl.create(:match).id
    end

    example_request "Get a match" do
      expect(status).to eq 200
    end
  end

  get "/matches" do
    before do
      FactoryGirl.create(:match, scheduled_start_at: DateTime.new(2015,7,9,6,30))
      FactoryGirl.create(:match, scheduled_start_at: DateTime.new(2015,7,9,7,30))
    end
    example_request "List matches" do
      expect(status).to eq 200
    end
  end

end
