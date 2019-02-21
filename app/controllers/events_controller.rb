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

    respond_to do |format|
      if @event.save
        format.html { 
          redirect_to "/events", 
          flash[:success] ='Event was successfully created.' 
        }
        format.json { render :new, status: :created, location: @event }
      else
        format.html { 
          render :new, 
          flash.now[:danger] = @event.errors.full_messages
        }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @event.image.attach(img_params)
    @event.update(event_params)
    redirect_to "/events"
  end

  def destroy
    @event.destroy
    redirect_to '/events'
  end
end
