class UsersController < ApplicationController
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

  #show
  def show
  	@user = User.find(params[:id])
  end

  #avoid xss
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
