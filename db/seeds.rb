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
  SECT_INDEX = ["I","II","III","IV","V","VI","VII","VIII","IX","X"]
  PART_INDEX = ["A","B","C","D","E","F","G","H","I","J","K"]

  def make_user(type)
    email_address = ENV["DEVELOPERS_EMAIL"].split("@").join("+#{type.to_s.downcase}@")
    unless (user = User.find_by(type: type.to_s.capitalize, email: email_address))
      user = User.create type: type.to_s.capitalize,
        first_name: type.to_s.capitalize,
        last_name: "Test",
        email: email_address,
        password: "Password1!",
        password_confirmation: "Password1!"
      user.confirm
    end
    user
  end

  u = make_user(:student)
  puts "Student Login: #{u.email} Password: #{password}"
  u = make_user(:supervisor)
  puts "Supervisor Login: #{u.email} Password: #{password}"
  u = make_user(:admin)
  puts "Admin Login: #{u.email} Password: #{password}"

  unless Course.find_by(name: "Course Primus", category: "MAIN:FORK")
    course = Course.create(name: "Course Primus", category: "MAIN:FORK", description: "The First COurse of the Day", objective: "Iron Trousers", reason_why: "Because its true")
    (1..2).each do |number|
      lesson = course.children.create(name: "Lesson #{number}")
      lesson.audio_visuals.create(source: FFaker::Name.name)
      (0..1).each do |item|
        sect = lesson.children.create(name: "Section #{SECT_INDEX[item]}")
        sect.definitions.create(word: FFaker::Name.name)
        (0..1).each do |i|
          part = sect.children.create(name: "Part #{PART_INDEX[i]}")
          part.qualifications.create(question: FFaker::Name.name)
        end
      end
    end
    Course.reset_lineage_tree
  end

end
