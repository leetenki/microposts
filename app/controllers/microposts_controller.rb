class MicropostsController < ApplicationController
	before_action :logged_in_user, :only => [:create, :destroy, :retweet, :reply, :favorite]

	def create
		@micropost = current_user.microposts.build(micropost_params)
		@micropost.micropost_type = "tweet"
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = current_user.feed_items.includes(:user).order(:created_at => :desc).page(params[:page])
			render 'static_pages/home'
		end
	end

	def retweet
		@micropost = current_user.microposts.build(micropost_params)
		@micropost.micropost_type = "retweet"
		@origin = Micropost.find(params[:origin_id])
		if !@origin.nil? && (current_user != @origin.user) && @micropost.save
			@micropost.retweet(params[:origin_id])
			flash[:success] = "Succeed to retweet"
	    redirect_to root_url
		else
			flash[:danger] = "Failed to retweet. " + (@micropost.errors.full_messages[0] if @micropost.errors.any?)
	    redirect_to request.referrer || root_url
		end
	end

	def reply
		@micropost = current_user.microposts.build(micropost_params)
		@micropost.micropost_type = "reply"
		@origin = Micropost.find(params[:origin_id])
		if !@origin.nil? && @micropost.save
			@micropost.reply(params[:origin_id])
			flash[:success] = "Succeed to reply"
	    redirect_to root_url
		else
			flash[:danger] = "Failed to reply. " + (@micropost.errors.full_messages[0] if @micropost.errors.any?)
			redirect_to request.referrer || root_url
		end
	end

	def favorite
		@micropost = Micropost.find(params[:micropost_id])
		if(!@micropost.nil?)
			if(@micropost.id.in? current_user.favorite_micropost_ids)
				@current_user.favorite_relationships.find_by(:micropost_id => @micropost.id).destroy
			else
				@micropost.add_favorite(current_user.id)
			end
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
