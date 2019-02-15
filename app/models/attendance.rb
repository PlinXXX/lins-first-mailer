class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event

	after_create :welcome_to_event

  def welcome_to_event
  	@user = Attendance.last.user  	
    UserMailer.welcome_to_event(@user).deliver_now
  end
end
