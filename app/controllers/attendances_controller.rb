class AttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:new, :create]

	include AttendancesHelper

	def new
		@user = current_user
	end

	def create
		@user = current_user
		# Amount in cents
		if isnt_free?
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

			@stripe_customer_id = @customer.id
		else
			@stripe_customer_id = 'Free!!'
		end

		@attendance = Attendance.new(
			stripe_customer_id: @stripe_customer_id,
			user_id: @user.id,
			event_id: @event.id
		)


		respond_to do |format|
	    if @attendance.save
	      format.html { redirect_to event_path(@event.id), notice: 'Success' }
	      format.json { render :new, status: :created, location: @attendance }
	    else	        
       	format.html { render :new }
	      format.json { render json: @attendance.errors, status: :unprocessable_entity }
	    end
	  end
	end
end