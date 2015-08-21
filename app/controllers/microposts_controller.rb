class MicropostsController < ApplicationController
	before_action :logged_in_user, :only => [:create, :destroy]

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = current_user.feed_items.includes(:user).order(:created_at => :desc).page(params[:page])
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost = current_user.microposts.find_by(:id => params[:id])
		if @micropost.nil?
			redirect_to root_url
		end

		@micropost.destroy
		flash[:success] = "Succeed to destroy micropost"
		redirect_to request.referrer || root_url
	end

	private
	def micropost_params
		params.require(:micropost).permit(:content)
	end
end
