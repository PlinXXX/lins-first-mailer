class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!, only: [:secret]
  before_action :set_user, only: [:show, :edit, :update]

  def new
  end

  def create
  end

	def show
    @sent_messages = @user.sent_messages
    @received_messages = @user.received_messages
	end

	def edit
    @avatar = @user.avatar
	end

	def update
		respond_to do |format|
      if @user.email == "admin@yopmail.com"
        @user.is_admin = true 
      else
        @user.is_admin = false
      end 

      if @user.update(user_params)
        format.html { redirect_to user_path(@user.id), notice: 'Profil was successfully updated.' } if !@user.is_admin
        format.html { redirect_to admin_user_path(@user.id), notice: 'Profil was successfully updated.' } if @user.is_admin
        format.json { render :edit, status: :updated, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end	
end
