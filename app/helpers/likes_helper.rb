module LikesHelper
	def find_event
		@event = Event.find(params[:event_id])
	end

	def find_like
		@like = @event.likes.find(params[:id])
	end

	def already_liked?
		Like.where(user_id: current_user.id, event_id: @event.id).exists?
	end

	def pre_like 
		@event.likes.find {|like| like.user_id == current_user.id}
	end
end
