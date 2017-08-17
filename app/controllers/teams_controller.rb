class TeamsController < ApplicationController
	before_action :set_team, only: [:show]
  
  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def index
    @teams = Team.all
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def new
    @team = Team.new
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def create
    @team = Team.new(team_params)

    if params[:team][:player_one].blank?
    	flash[:alerts] = ['Player One Must Exist!']
    	render 'new'
    else
    	@team.users << User.find(params[:team][:player_one])
	    @team.users << User.find(params[:team][:player_two]) unless (params[:team][:player_two]).blank?

	    if @team.save
	      flash[:notices] = ['Team Created!']
	      redirect_to teams_path
	    else
	    	flash[:alerts] = @team.errors.full_messages
	    	render 'new'
	    end
    end
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def show
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def ranks
    @teams = Team.where("wins > 0	").order(win_percentage: :desc)
  end
  

  private

  	def set_team
      @team = Team.find(params[:id])
    end

	  def team_params
	    params.require(:team).permit(:player_one, :player_two)
	  end
end
