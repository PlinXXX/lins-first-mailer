class LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_event
	before_action :find_like, only: [:destroy]
	include LikesHelper

	def create
		if already_liked?
			flash[:notice] = "You can't like more than once"
		else
			@event.likes.create(
				user_id: current_user.id,
			)
			redirect_to event_path(@event.id)
		end
	end

	def destroy
		if !(already_liked?)
			flash[:notice] = "Can'not unlike"			
		else
			@like.destroy
		end		
		
		redirect_to event_path(@event.id)
	end
end
