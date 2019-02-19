class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_user, only: [:show, :edit, :update]

  def new
  end

  def create
  	@user.is_admin = true if @user.email == "admin@yopmail.com"
  end

	def show
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
        format.html { redirect_to user_path(@user.id), notice: 'Profil was successfully updated.' }
        format.json { render :edit, status: :updated, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def set_user
		@user = current_user
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :description)
	end
	
end
