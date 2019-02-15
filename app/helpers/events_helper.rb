module EventsHelper

	def end_date(event)
		@start_date = event.start_date
		@duration = event.duration
		@start_date + @duration*3600
	end

	def is_free?(event)
		event.price == 0
	end
end
