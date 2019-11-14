require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'creating seeds'

User.create(
  username: 'cdafonseca',
  email: 'dafonseca.ca@gmail.com',
  password: '12345678',
  phone_number: Faker::Company.duns_number,
  user_type: "Trainer",
  first_name: "Caroline",
  last_name: "Da Fonseca",
  city: "Amsterdam",
  gender: "female"
  )

User.create(
  username: 'hello',
  email: 'hello@gmail.com',
  password: '12345678',
  phone_number: Faker::Company.duns_number,
  user_type: "Trainee",
  first_name: "Sam",
  last_name: "Smith",
  city: "London",
  gender: "male"
  )

5.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8, max_length: 40),
    phone_number: "Faker::Compan.duns_number",
    user_type: "trainer",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: Faker::Address.city,
    gender: ["male", "female"].sample
    )
  user.save!
end

5.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 8, max_length: 40),
    phone_number: "Faker::Company.duns_number",
    user_type: "trainee",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: Faker::Address.city,
    gender: ["male", "female"].sample
    )
  user.save!
end

5.times do
  course = Course.new(
    name: Faker::Lorem.word,
    category: ["yoga", "running", "pilates", "kick-boxing", "body burn"].sample,
    description: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    user_id: User.where(user_type: "trainer").sample.id
    )
  course.save!

  5.times do
    review = Review.new(
      stars: [1, 2, 3, 4, 5].sample,
      description: Faker::Lorem.sentence,
      course_id: course.id
      )
    review.save!
  end
  5.times do
    timeslot = Timeslot.new(
      date: Faker::Date.in_date_period(month: 12),
      time: ["08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00"].sample,
      course_id: course.id
      )
    timeslot.save
  end
end

puts 'seeds created'
