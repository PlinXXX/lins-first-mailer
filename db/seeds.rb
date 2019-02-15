# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(
# 	email: "plinsy2@gmail.com",
# 	encrypted_password: "01010101",
# 	description: "Hackeur à plein temps",
# 	first_name: "Princy",
# 	last_name: "Lins"
# )

# 10.times do |n|
# 	User.create(
# 		first_name: Faker::Name.first_name,
# 		last_name: Faker::Name.last_name,
# 		email: "#{Faker::Name.first_name}@yopmail.fr",
# 		encrypted_password: 0*n+1,
# 		description: "Hackeur à plein temps"
# 	)	
# end

# Event.create(
# 	admin: User.first,
#   start_date: Time.now,
#   duration: 24,
#   title: "The event",
#   description: "L'event du siecle à ne surtout pas rater",
#   price: 10000,
#   location: "Isotry"
# )

# Attendance.create(
# 	stripe_customer_id: 1,
# 	event: Event.first,
# 	user: User.first
# )

# User.all do |user|
# 	user.destroy
# end
# Attendance.all do |user|
# 	user.destroy
# end
# Event.all do |user|
# 	user.destroy
# end