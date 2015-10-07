require "api_documentation_helper"

RSpec.resource "Players" do
  header "Content-Type", "application/vnd.api+json"

  shared_context :players_parameters_description do

    parameter :type, <<-DESC, required: true
      Should always be set to <code>buyers</code>.
    DESC

    parameter :name, <<-DESC, scope: :attributes, require: true
      The name of the player.
    DESC

    parameter :matches, <<-DESC, scope: :relationships
      The matches that the player is assigned to.
    DESC

  end

  post "/players" do

    include_context :players_parameters_description

    let(:type) { :players }

    let(:name) { "Sean Devine" }

    example_request "Create a player" do
      expect(status).to eq 201
    end
  end

  post "/players" do

    include_context :players_parameters_description

    let(:type) { :players }

    let(:name) { nil }

    example_request "Create a player and receive an error" do
      expect(status).to eq 422
    end
  end

  get "/players/:id" do
    parameter :id, <<-DESC, required: true
      ID of the player to be retrieved.
    DESC

    let(:id) do
      FactoryGirl.create(:player).id
    end

    example_request "Get a player" do
      expect(status).to eq 200
    end
  end

  get "/players" do
    before do
      FactoryGirl.create(:player, name: "Sean Devine")
      FactoryGirl.create(:player, name: "Peter Coumounduros")
    end
    example_request "List players" do
      expect(status).to eq 200
    end
  end

  get "/players?include=matches" do
    before do
      p1 = FactoryGirl.create(:player, name: "Sean Devine")
      p2 = FactoryGirl.create(:player, name: "Peter Coumounduros")
      match = FactoryGirl.create(:match)
      p1.matches << match
      p2.matches << match
    end
    example_request "List players and include matches" do
      expect(status).to eq 200
      expect(JSON.parse(response_body)["included"].size).to eq 1
    end
  end

  get "/players?sort=name" do
    before do
      p1 = FactoryGirl.create(:player, name: "Sean Devine")
      p2 = FactoryGirl.create(:player, name: "Peter Coumounduros")
    end
    example_request "List players and sort by name ascending" do
      expect(status).to eq 200
      expect(JSON.parse(response_body)["data"][0]["attributes"]["name"]).to eq "Peter Coumounduros"
    end
  end

  get "/players?fields[players]=updated-at" do
    before do
      p1 = FactoryGirl.create(:player, name: "Sean Devine")
      p2 = FactoryGirl.create(:player, name: "Peter Coumounduros")
    end
    example_request "List players and only fetch the updated-at attribute" do
      expect(status).to eq 200
      expect(JSON.parse(response_body)["data"][0]["attributes"].size).to eq 1
    end
  end

  get "/players" do
    let! :p1 do
      FactoryGirl.create(:player, name: "Sean Devine")
    end
    let! :p2 do
      FactoryGirl.create(:player, name: "Peter Coumounduros")
    end
    let! :p3 do
      FactoryGirl.create(:player, name: "Josh Smith")
    end
    example "List players with the id 1 or 2" do
      do_request(filter: { id: "#{p1.id},#{p2.id}"})
      expect(status).to eq 200
      expect(JSON.parse(response_body)["data"].size).to eq 2
    end
  end

  get "players?page[limit]=4" do
    before do
      5.times do |n|
        FactoryGirl.create(:player, name: "Kid #{n}")
      end
    end
    example_request "List players 4 at a time" do
      expect(status).to eq 200
      expect(JSON.parse(response_body)["data"].size).to eq 4
    end
  end

  get "players?page[offset]=4" do
    before do
      5.times do |n|
        FactoryGirl.create(:player, name: "Kid #{n}")
      end
    end
    example_request "List the second page of players" do
      expect(status).to eq 200
      expect(JSON.parse(response_body)["data"].size).to eq 1
    end
  end
end
