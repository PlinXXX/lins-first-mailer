class AttendancesController < ApplicationController
  before_action :authenticate_user!
	include AttendancesHelper

	def new
		@user = current_user
		@event = Event.find(params[:event_id])
	end

	def create
		@event = Event.find(params[:event_id])
		@user = current_user

		# Amount in cents
		  @amount = 500

		  @customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )

		  @charge = Stripe::Charge.create(
		    :customer    => @customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd'
		  )

		@attendance = Attendance.create(
			stripe_customer_id: @customer.id,
			user_id: @user.id,
			event_id: @event.id
		)

		rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to root_path
		end
		
	end


    private

    def is_uniq?
			@one = []
			@all = Attendance.all
			@all.each do |att|
				@one << att if (att.user == current_user && att.event == @event)
			end
			@one.length == 0
		end

		# In 02 Feb 19
		def usd(price)
			0.0003*price.round(2)
		end
