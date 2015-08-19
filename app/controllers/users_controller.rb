class UsersController < ApplicationController
  before_action :logged_in_user, :only => [:edit, :update, :followings, :followers, :tweets]

  #render following page
  def followings
    @following_users = User.find(params[:id]).following_users
  end

  #render followers page
  def followers
    @follower_users = User.find(params[:id]).follower_users
  end

  #render tweets page
  def tweets
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end


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
    @user = current_user
  end

  #update
  def update
    if current_user.update(user_params)
      flash[:success] = "Succeed to update profile!"
      redirect_to user_path(@current_user)
    else
      @user = current_user
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
    @microposts = @user.microposts
  end

  #avoid xss
  private
  def user_params
    params.require(:user).permit(:name, :email, :country_code, :state_code, :profile, :password, :password_confirmation)
  end
end
