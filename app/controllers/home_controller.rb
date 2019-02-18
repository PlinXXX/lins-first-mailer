class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_user
  
  def index
  	@all_events = Event.all.reverse

  	respond_to do |format|
			format.html
			format.js
	  end
  end

  def secret
  end

  private

  def set_user
    @user = current_user
  end
end
