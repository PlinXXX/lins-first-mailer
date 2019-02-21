module UsersHelper
	def set_user
		@user = current_user
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :description)
	end

	def method_name
		
	end

	def all_user_conversations
		@all_user_conv = Array.new
		@user.sent_messages.each do |sm|
			@all_user_conv << sm
		end
		@user.received_messages.each do |rm|
			@all_user_conv << rm
		end
		@all_user_conv
	end
end
