class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  def index
  	@all_events = Event.all.reverse

  	respond_to do |format|
			format.html
			format.js
	  end
  end

  def secret
  end
end
