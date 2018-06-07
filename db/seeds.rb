# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# if Rails.env.development?
#   password = ENV["ADMINISTRATORS_PASSWORD"]

#   email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+student@")
#   u = Student.create(first_name: "Student", last_name: "Test", email: email_address, password: password, password_confirmation: password)
#   puts "Student Login: #{u.email} Password: #{password}"

#   email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+supervisor@")
#   u = Supervisor.create(first_name: "Supervisor", last_name: "Test", email: email_address, password: password, password_confirmation: password)
#   puts "Supervisor Login: #{u.email} Password: #{password}"

#   email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+admin@")
#   u = Admin.create(first_name: "Admin", last_name: "Test", email: email_address, password: password, password_confirmation: password)
#   puts "Admin Login: #{u.email} Password: #{password}"
# end

require_relative "seeding/course_data"
