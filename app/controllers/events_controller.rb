class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  attr_accessor :event
  include  EventsHelper

  def index
    @current_user = current_user
  	@all_events = current_user.created_events
  end

  def show
    @event = Event.find(params[:id])
  	@current_user = current_user
  end

  def create
    if params[:description]
      @description = params[:description]
    else  
      @description = "Please edit your event in your profile page"
    end
    @event = Event.new(
      admin_id: current_user.id,
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: @description,      
      price: params[:price],
      location: params[:location]
    )

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
    @event = Event.find(params[:id])
  end

  def update
    puts params.inspect
    @event = Event.find(params[:id])

    @event.update(
      start_date: params[:start_date],
      duration: params[:duration],
      title: params[:title],
      description: params[:description],      
      price: params[:price],
      location: params[:location]
    )
    redirect_to "/events"
  end

  def destroy
    puts params.inspect
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to '/events'
  end

  private

  def event_params
    params.require(:event).permit[:admin_id, :start_date, :duration, :title, :description, :price, :location]
  end
end
