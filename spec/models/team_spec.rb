require 'rails_helper'

RSpec.describe Team, type: :model do

	it "Create a Team" do
  	team = Team.create!(player_one: "Ahmad", player_two: "Abu")

		expect(Team.all.count).to eq 1
  end

end
