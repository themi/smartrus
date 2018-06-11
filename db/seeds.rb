# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
exit unless Rails.env.development?

require "yaml"

puts "-----------------------------"
puts " Smoke testing login details!"
puts "-----------------------------"
password = ENV["ADMINISTRATORS_PASSWORD"]

email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+student@")
u = Student.create(first_name: "Student", last_name: "Test", email: email_address, password: password, password_confirmation: password)
puts "Student Login: #{u.email} Password: #{password}"

email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+supervisor@")
sup = Supervisor.create(first_name: "Supervisor", last_name: "Test", email: email_address, password: password, password_confirmation: password)
puts "Supervisor Login: #{sup.email} Password: #{password}"

email_address = ENV["ADNINISTRATOR_EMAIL"].split("@").join("+admin@")
admin = Admin.create(first_name: "Admin", last_name: "Test", email: email_address, password: password, password_confirmation: password)
puts "Admin Login: #{admin.email} Password: #{password}"
puts "-----------------------------"

filename = Rails.root.join("db/seeding/ironing_trousers.en.yml")
Courseify.load_yaml(YAML.load(File.read(filename)), sup)
puts "seeding completed!"

