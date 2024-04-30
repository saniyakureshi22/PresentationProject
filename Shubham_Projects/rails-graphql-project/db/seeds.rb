# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Seed data for users table
20.times do |i|
  User.create!(
    first_name: "First Name #{i+1}",
    last_name: "Last Name #{i+1}",
    email: "user#{i+1}@example.com"
  )
end

# Seed data for blogs table
User.all.each do |user|
  5.times do |i|
    user.blogs.create!(
      title: "Blog Title #{i+1}",
      description: "Blog Description #{i+1} by #{user.first_name} #{user.last_name}"
    )
  end
end
