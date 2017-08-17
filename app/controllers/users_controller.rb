class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update]
  
  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def index
    @users = User.all
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def new
    @user = User.new
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ['User Created!']
      redirect_to users_path
    else
    	flash[:alerts] = @user.errors.full_messages
      render 'new'
    end
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def edit
  end

  # Created : August 16th, 2017
  # by : muh.daniramdani@gmail.com
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notices] = ['User Updated!']
      redirect_to '/users'
    else
      flash[:alerts] = @user.errors.full_messages
      render 'edit'
    end
  end


  private

  	def set_user
      @user = User.find(params[:id])
    end

	  def user_params
	    params.require(:user).permit(:firstname, :lastname, :username)
	  end
end
