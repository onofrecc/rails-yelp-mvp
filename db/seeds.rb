# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts 'Deleting all records in the database....'
Restaurant.destroy_all

puts 'Creating restaurants and reviews...'
5.times do
  category = ['chinese', 'italian', 'japanese', 'french', 'belgian']
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    category: category.sample
  )
  restaurant.save!

  rand(0..10).times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
    review.save!
  end
end

puts 'Done for now! Go ahead with your coding!'
