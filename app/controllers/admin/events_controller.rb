module Admin
  class EventsController < Admin::ApplicationController
    include EventsHelper
    before_action :set_event, only: [:show, :edit, :update, :destroy]
    
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Event.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Event.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def index
      @all_events = Event.where(is_validate: false)
    end

    def edit
    end

    def update
    end
    
  end
end
