# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
  User.create!(
    name: name,
    email: "#{name}@gmail.com",
    password: "password",
    password_combination: "password"
  )
end

user = User.first

15.times do
  Event.create!(
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph(sentence_count: 1),
    address: Faker::Address.full_address,
    start_time: Time.current,
    end_time: Time.current + 1.hour
  )
end
