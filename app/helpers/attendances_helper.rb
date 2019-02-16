module AttendancesHelper
	
  def set_event
		@event = Event.find(params[:event_id])
  end

		# In 02 Feb 19
	def usd(price)
		0.0003*price.round(2)
	end

	def is_free?
		@event.price == 0
	end

	def isnt_free?
		!is_free?
	end

  def is_uniq? # Are you already in this event ?
    @one = []
    @all = Attendance.all
    @all.each do |att|
      @one << att if (att.user == current_user && att.event == @event)
    end
    @one.length == 0
  end
end
