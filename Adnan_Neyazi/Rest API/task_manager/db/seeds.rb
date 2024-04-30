# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create 2 users
2.times do
  User.create(
    email: Faker::Internet.email,
    encrypted_password: Devise::Encryptor.digest(User, Faker::Internet.password)
  )
end

# Create 20 categories
20.times do
  Category.create(
    name: Faker::Commerce.department,
    description: Faker::Lorem.sentence,
    user_id: User.pluck(:id).sample
  )
end

# Create 20 customers
20.times do
  Customer.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    user_id: User.pluck(:id).sample
  )
end
