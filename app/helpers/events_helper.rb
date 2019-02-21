module EventsHelper
	attr_accessor :title, :duration, :start_date, :location, :price, :description

  def event_params
    params.require(:event).permit(:title, :duration, :start_date, :location, :price, :description)
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

  
  def end_date(event)
    start_date = event.start_date
    duration = event.duration
    end_date = start_date + duration*3600
  end

  def is_free?(event)
    event.price == 0
  end

  def is_started?
    start_date(@event) < Time.now
  end

  def is_past?
    end_date(@event) < Time.now
  end
end
