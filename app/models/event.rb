class Event < ApplicationRecord
	validates :start_date, presence: true #start_date should be in the future
	validates :duration, presence: true # length in min should be divised by 5
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true, length: {in: 20..1000}
	validates :price, presence: true, length: {in:0..1000}
	validates :location, presence: true

	belongs_to :admin, foreign_key: 'admin_id', class_name: "User"
	has_many :attendances
	has_many :users, through: :attendances
end
