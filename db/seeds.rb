# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  raise "set the envvar DEVELOPERS_EMAIL before running db:seed" if ENV["DEVELOPERS_EMAIL"].nil?
  password = ENV["DEVELOPERS_PASSWORD"] || "Password1!"

  def make_user(type)
    user = FactoryBot.create type.to_sym,
      first_name: type.to_s.capitalize,
      last_name: "Test",
      email: ENV["DEVELOPERS_EMAIL"].split("@").join("+#{type.to_s.downcase}@"),
      password: "Password1!",
      password_confirmation: "Password1!"
    user.confirm
    user
  end

  u = make_user(:student)
  puts "Student Login: #{u.email} Password: #{password}"
  u = make_user(:supervisor)
  puts "Supervisor Login: #{u.email} Password: #{password}"
  u = make_user(:admin)
  puts "Admin Login: #{u.email} Password: #{password}"
end
