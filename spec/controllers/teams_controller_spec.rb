require 'rails_helper'

RSpec.describe TeamsController, type: :controller do

	describe "Team (GET #index)" do
  	before :each do
     	@team = create(:team)
    end

    it "Success to Get Teams" do
    	get :index

    	expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    	expect(assigns(:teams).count).to eq 1
	    expect(assigns(:teams)).to match_array([@team])
	    expect(assigns(:teams).first["player_one"]).to eq "Ahmad"
    end
  end


	describe "Team (POST #create)" do
		before :each do
     	@user = create(:user)
    end

    it "Success to Create a Team" do
	    post :create, { :team => {:player_one => @user.id} }

	    expect(response).to redirect_to(:action => "index")
    end
  end

  describe "Team (GET #show)" do
  	 before :each do
     	@team = create(:team)
    end

    it "Success to Get a Team" do
    	get :show, params: { id: @team.id }

	    expect(assigns(:team).player_one).to eq "Ahmad"
      expect(response).to have_http_status(200)
    end
  end

  

end
