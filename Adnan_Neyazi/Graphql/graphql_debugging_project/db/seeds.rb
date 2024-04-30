# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: "Adnan Neyazi", email: "adnan@example.com")
user2 = User.create(name: "Neyazi Adnan", email: "neyazi@example.com")

Post.create(title: "First Post", content: "Content of the first post", user: user1)
Post.create(title: "Second Post", content: "Content of the second post", user: user2)
