# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Flat.delete_all
4.times do
  Flat.new(name:Faker::Name.name, address:Faker::Address.full_address, description:Faker::Company.catch_phrase, price_per_night: Faker::Number.between(1, 100), number_of_guests: Faker::Number.between(1, 7)).save
end
