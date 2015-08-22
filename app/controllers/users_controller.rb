class UsersController < ApplicationController
  before_action :logged_in_user, :only => [:edit, :update, :followings, :followers, :tweets, :index, :search]

  #render following page
  def followings
    @user = User.find(params[:id])
    @following_users = @user.following_users
    @total = @following_users.count
    @following_users = @following_users.order(:created_at => :desc).page(params[:page])
  end

  #render followers page
  def followers
    @user = User.find(params[:id])
    @follower_users = @user.follower_users
    @total = @follower_users.count
    @follower_users = @follower_users.order(:created_at => :desc).page(params[:page])
  end

  #favorites
  def favorites
    @user = User.find(params[:id])
    @microposts = @user.favorite_microposts.page(params[:page])
  end

  #render tweets page
  def tweets
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
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
      session[:user_id] = @user.id
      redirect_to users_path
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
    @microposts = @user.microposts.order(:created_at => :desc).page(params[:page])
  end

  #render index page
  def index
    @users = User.all
    @total = @users.count
    @users = @users.order(:created_at => :desc).page(params[:page])
    @user = current_user
    @search_target = Keyword.new
  end

  #search method
  def search
    @search_target = Keyword.new(:name => params[:keyword][:name])
    @user = current_user
    if @search_target.validate
      @users = User.where("name like ?", "%" + @search_target.name + "%")
    else
      @users = User.all
    end
    @total = @users.count
    @users = @users.page(params[:page])
    render 'index'
  end

  #avoid xss
  private
  def user_params
    params.require(:user).permit(:name, :email, :country_code, :state_code, :profile, :password, :password_confirmation)
  end
end
