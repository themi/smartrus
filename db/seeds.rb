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
    course = Course.create(name: "Course Primus", category: "MAIN:FORK")
    (1..2).each do |number|
      lesson = course.lessons.create(name: "Lesson #{number}")
      lesson.audio_visuals.create(source: FFaker::Name.name)
      (1..3).each do |item|
        sect = lesson.sections.create(name: "Section #{SECT_INDEX[item]}", course_id: course.id)
        sect.qualifications.create(question_or_task: FFaker::Name.name)
        (1..5).each do |i|
          part = sect.parts.create(name: "Part #{PART_INDEX[i]}", course_id: course.id)
          part.definitions.create(word: FFaker::Name.name)
          part.qualifications.create(question_or_task: FFaker::Name.name)
          av = part.audio_visuals.create(source: FFaker::Name.name)
          av.transcripts.create(language: "en:gb", body: FFaker::Name.name)
        end
      end
    end
  end

end
