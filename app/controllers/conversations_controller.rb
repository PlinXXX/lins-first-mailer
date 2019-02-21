class ConversationsController < ApplicationController
	include UsersHelper
	include ConversationHelper

  before_action :set_user

	def new
		@conversation = Conversation.new
		@all_user = User.all
	end

	def create
		@all_user = User.all

		@conversation = Conversation.new(
			sender: current_user,
			recipient: User.find_by(email: params[:recipient]),
			content: params[:content]
		)

		respond_to do |format|
      if @conversation.save
        format.html { redirect_to user_conversations_path(@user.id), notice: 'Mess was successfully sent.' }
        format.json { render :new, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
	end

	def index
		@sent_mess = current_user.sent_messages.order(created_at: :desc)
		@received_mess = current_user.received_messages.order(created_at: :desc)
		@all_conv = all_user_conversations
	end

	def destroy
		@conv = Conversation.find(params[:id])
		@conv.destroy
		redirect_to user_conversations_path(@user.id)
	end

	def show
		@private_messages = private_messages
		@mess = mess_received_from_the_other_user
	end
end
