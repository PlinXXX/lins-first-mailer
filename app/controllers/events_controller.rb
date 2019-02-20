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
    @event.admin = current_user

    respond_to do |format|
      if @event.save
        @event.image.attach(img_params)
        format.html { redirect_to "/events", notice: 'Event was successfully created.' }
        format.json { render :new, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to "/events"
  end

  def destroy
    @event.destroy
    redirect_to '/events'
  end

  private

  def event_params
    params.require(:event).permit(:title, :duration, :start_date, :location, :price, :description, :image)
  end

  def img_params
    params[:image]
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
