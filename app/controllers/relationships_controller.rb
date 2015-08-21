class RelationshipsController < ApplicationController
	before_action :logged_in_user, :only => [:create, :destroy]

	def create
    @page_owner = User.find(params[:page_owner_id])
		@user = User.find(params[:followed_id])
		current_user.follow(@user)
	end

	def destroy
    @page_owner = User.find(params[:page_owner_id])
		@user = current_user.following_relationships.find(params[:id]).followed
		current_user.unfollow(@user)
	end
end
