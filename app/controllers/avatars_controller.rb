class AvatarsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		
		if params[:avatar]
			@user.avatar.attach(params[:avatar])
    	redirect_to(user_path(@user))
		else
    	redirect_to(user_path(@user))
		end
	end
end
