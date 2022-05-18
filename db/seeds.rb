# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
# Examples:
category = ["chinese", "italian", "japanese", "french", "belgian"]
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "I'm destroying all restaurant"
Restaurant.destroy_all
puts "done"

puts "Now I'm seeding"
8.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: category.sample,
    phone_number: Faker::PhoneNumber.phone_number
  )
  10.times do
    Review.create(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant: restaurant
    )
  end
end
puts "Done"
