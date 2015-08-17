class SessionsController < ApplicationController
  #get login page
  def new
  end

  #create new session
  def create
  	@user = User.find_by(:email => params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		session[:user_id] = @user.id
  		flash[:info] = "logged in as #{@user.name}"
  		redirect_to user_path(@user)
  	else
  		flash[:danger] = 'invalid email/password combination'
  		render 'new'
  	end
  end

  #destroy session
  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
