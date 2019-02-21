module ConversationHelper

	def mess_received_from_the_other_user
		c = Conversation.where(
			sender_id: params[:user_id], 
			recipient_id: current_user.id
		)
		c.first		
	end

	def private_messages
		pm = Array.new
		c = Conversation.where(
			sender_id: params[:user_id], 
			recipient_id: current_user.id
		)
		c.each do |mess|
			pm << mess
		end
		c = Conversation.where(
			sender_id: current_user.id, 
			recipient_id: params[:user_id]
		)
		c.each do |mess|
			pm << mess
		end

		pm
	end
end
