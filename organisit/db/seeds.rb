# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Course.delete_all
Classroom.delete_all
Enrolment.delete_all

User.create!(email: "student@organisit.com", password: "password", role: "student", name: Faker::Name.name, active: "active", photo: Faker::Avatar.image("users", "50x50", "jpg"))

instructor1 = User.create!(email: "staff@organisit.com", password: "password", role: "staff", name: Faker::Name.name + " MAIN", active: "active", canbeinstructor: true, photo: Faker::Avatar.image("users", "50x50", "jpg"))

instructor2 = User.create!(email: Faker::Internet.email, password: "password", role: "staff", name: Faker::Name.name, active: "active", canbeinstructor: true, photo: Faker::Avatar.image("users", "50x50", "jpg"))

instructor3 = User.create!(email: Faker::Internet.email, password: "password", role: "staff", name: Faker::Name.name, active: "active", canbeinstructor: true, photo: Faker::Avatar.image("users", "50x50", "jpg"))

20.times do |n|
    a = User.new
    a.name =  Faker::Name.name
    a.email =  Faker::Internet.email 
    a.photo = Faker::Avatar.image("users", "50x50", "jpg")
    a.password = "password"
    a.active = "active"
    a.role = "student"
    a.canbeinstructor = false
    a.save!
end

2.times do |n|
  a = Classroom.new
  a.name = Faker::Hacker.noun.capitalize + " West"
  a.address = "Second Home"
  a.city = "London"
  a.capacity = 10
  a.save!
end

2.times do |n|
  a = Classroom.new
  a.name = (Faker::Hacker.noun).capitalize + " East"
  a.address = "Back Hill"
  a.city = "London"
  a.capacity = 15
  a.save!
end

5.times do |n|
    a = Course.new
    a.title = "Introduction to " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + " " + Faker::Hacker.ingverb
    a.description = Faker::Lorem.paragraph 
    a.code = Faker::Address.building_number
    a.startdate = Faker::Date.forward(60)
    a.enddate = a.startdate + 3
    a.max_no_of_students = Faker::Number.digit
    a.category = "Programming"
    a.afternoon = true
    a.classroom_id = Classroom.first.id
    a.thursday = true
    a.save!
end

3.times do |n|
    a = Course.new
    a.title = Faker::Hacker.adjective.capitalize + " " + Faker::Hacker.noun + " architecture"
    a.description = Faker::Lorem.paragraph 
    a.code = Faker::Address.building_number
    a.startdate = Faker::Date.forward(5)
    a.enddate = a.startdate + 3
    a.max_no_of_students = Faker::Number.digit
    a.category = "Advanced Programming"
    a.afternoon = true
    a.classroom_id = Classroom.offset(2).first.id
    a.friday = true
    a.save!
end



Enrolment.create!(position: "student", user_id: User.offset(12).limit(1).first.id, course_id: Course.first.id)

Enrolment.create!(position: "instructor", user_id: instructor1.id, course_id: Course.first.id)

Enrolment.create!(position: "instructor", user_id: instructor1.id, course_id: Course.offset(3).limit(1).first.id)

Enrolment.create!(position: "student", user_id: User.offset(12).limit(1).first.id, course_id: Course.offset(3).limit(1).first.id)

Enrolment.create!(position: "student", user_id: User.offset(13).limit(1).first.id, course_id: Course.offset(2).limit(1).first.id)

Enrolment.create!(position: "student", user_id: User.where(email: "student@organisit.com").first.id, course_id: Course.offset(3).limit(1).first.id)

Enrolment.create!(position: "student", user_id: User.where(email: "student@organisit.com").first.id, course_id: Course.offset(2).limit(1).first.id)








