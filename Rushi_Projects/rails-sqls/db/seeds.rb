# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create users
user1 = User.create(name: 'Dhananjay Bhoyar')
user2 = User.create(name: 'dm bhhoyar')

# Create posts for user1
post1 = user1.posts.create(title: 'First Post', content: 'This is my first post')
post2 = user1.posts.create(title: 'Second Post', content: 'Another post by me')

# Create comments for post1
post1.comments.create(content: 'Great post!')
post1.comments.create(content: 'Looking forward to more')

# Create posts for user2
post3 = user2.posts.create(title: 'Hello World', content: 'My first post here')
post4 = user2.posts.create(title: 'Rails is awesome', content: 'Learning Rails is fun!')

# Create comments for post3
post3.comments.create(content: 'Welcome to the community!')
post3.comments.create(content: 'Keep up the good work')

# Output a message
puts 'Seed data created successfully'
