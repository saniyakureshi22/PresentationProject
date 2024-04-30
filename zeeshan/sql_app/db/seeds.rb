# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do
  first_name = Faker::Name.first_name
  User.create!(first_name: first_name, last_name: Faker::Name.last_name, email: "#{first_name}#{rand(999)}@test.com")
end

20.times do
  Article.create!(title: Faker::Book.title, description: Faker::Lorem.paragraphs(number: 3), user: User.find(User.ids.sample))
end