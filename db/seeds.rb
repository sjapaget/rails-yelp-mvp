# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Restaurant.destroy_all

puts "Creating restaurants"
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample(1).first
  )

  puts "saving restaurant"
  restaurant.save!

  puts "Adding reviews"
  3.times do
    review = Review.new(
      rating: Faker::Number.within(range: 0..5),
      content: Faker::Restaurant.review
    )
    puts "Adding restaurant id"
    review.restaurant = restaurant
    puts "saving review"
    review.save!
  end
  puts "restaurant created successfully"
end
