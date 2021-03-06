# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < ActionController::Base
    before_action :check_if_admin
    before_action :authenticate_admin

    def index
      
    end

    private
      def authenticate_admin
        # TODO Add authentication logic here.
      end

      def check_if_admin
        unless current_user.is_admin
          flash[:warning] = "Bien essayer petit malin"
          redirect_to home_index_path 
        end
      end

      # Override this value to specify the number of elements to display at a time
      # on index pages. Defaults to 20.
      # def records_per_page
      #   params[:per_page] || 20
      # endbefore_action :check_if_admin
  end
end
