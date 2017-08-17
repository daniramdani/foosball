class MatchesController < ApplicationController
	before_action :set_match, only: [:show]
  
  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def index
    @matches = Match.all
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def new
    @match = Match.new
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def create
    @match = Match.new(match_params)

    if params[:match][:team_one].blank?
    	flash[:alerts] = ['Team One Must Exist!']
    	render 'new'
    else
    	@match.teams << Team.find(params[:match][:team_one])
	    @match.teams << Team.find(params[:match][:team_two]) unless (params[:match][:team_two]).blank?
	    @match.winner?
	    @match.assign_winner
	    @match.team_wins

	    if @match.save
	      flash[:notices] = ['Match Created!']
	      redirect_to matches_path
	    else
	    	flash[:alerts] = @match.errors.full_messages
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
  def ranking
    @matchs = match.where("wins > 2").order(win_percentage: :desc)
  end
  

  private

  	def set_match
      @match = Match.find(params[:id])
    end

	  def match_params
	    params.require(:match).permit(:team_one, :team_two, :best_of, :team_one_score, :team_two_score, :winning_team)
	  end
end
