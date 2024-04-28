# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create some products
Product.create(name: "Product 1", description: "Description of Product 1", price: 10.99)
Product.create(name: "Product 2", description: "Description of Product 2", price: 20.99)
Product.create(name: "Product 3", description: "Description of Product 3", price: 30.99)

puts "Seed data has been created"
