class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_user
  include EventsHelper
  
  def index

  	@all_events = Event.where(is_validate: true).reverse

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
