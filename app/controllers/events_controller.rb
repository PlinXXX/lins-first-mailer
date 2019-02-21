class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  include  EventsHelper

  def index
    @user = current_user
  	@all_events = current_user.created_events
  end

  def new
    @event = Event.new
  end

  def show
  	@current_user = current_user
    @like = Like.find_by(user_id: current_user.id, event_id: @event.id)
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
    @event.is_validate = current_user.email == "admin@yopmail.com" ? true : false

    if @event.save
      redirect_to '/events'
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @event.is_validate
      @event.image.attach(img_params)
      @event.update(event_params)
      redirect_to "/events"
    else
      @event.update(admin_event_params)
      redirect_to "/admin/events"
    end
  end

  def destroy
    @event.destroy
    redirect_to '/events'
  end
end
