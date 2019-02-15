class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:secret]

	def show
		@current_user = current_user
	end

	def edit
		@current_user = current_user
	end

	def update
		@current_user = current_user

		respond_to do |format|
      if @current_user.update(first_name: params[:first_name], last_name: params[:last_name], description: params[:description])
        format.html { redirect_to user_path(@current_user.id), notice: 'Profil was successfully updated.' }
        format.json { render :edit, status: :updated, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
	end
	
end
