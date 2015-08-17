class UsersController < ApplicationController
  before_action :logged_in_user, :only => [:edit, :update]

  #signup page
  def new
  	@user = User.new
  end

  #save to database
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the micropost App!"
  		redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end

  #edit
  def edit
  	@user = @current_user
  end

  #update
  def update
  	if @current_user.update(user_params)
  		flash[:success] = "Succeed to update profile!"
  		redirect_to user_path(@current_user)
	else
        render 'edit'
	end
  end

  #subregion
  def subregion_options
  	render :partial => 'subregion_select'
  end

  #show
  def show
  	@user = User.find(params[:id])
  end

  #avoid xss
  private
  def user_params
  	params.require(:user).permit(:name, :email, :country_code, :state_code, :password, :password_confirmation)
  end
end
