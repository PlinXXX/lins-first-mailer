class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include  EventsHelper

  def index
    @current_user = current_user
  	@all_events = current_user.created_events
  end

  def new
    @event = Event.new
  end

  def show
  	@current_user = current_user
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to "/events", notice: 'Event was successfully created.' }
        format.json { render :new, status: :created, location: @gossip }
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
    params.require(:event).permit(:title, :duration, :start_date, :location, :price, :description)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
