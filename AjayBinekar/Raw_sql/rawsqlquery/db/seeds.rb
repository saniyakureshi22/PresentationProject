# seeds.rb

# Clear existing data
User.delete_all
Post.delete_all
Comment.delete_all

# Create users
user1 = User.create(name: "John", email: "john@example.com")
user2 = User.create(name: "Alice", email: "alice@example.com")
user3 = User.create(name: "Bob", email: "bob@example.com")
user4 = User.create(name: "Ajay", email: "ajay@example.com")

# Create posts
post1 = Post.create(title: "First Post", content: "This is the first post.", user: user1)
post2 = Post.create(title: "Second Post", content: "This is the second post.", user: user2)

# Create comments
comment1 = Comment.create(content: "Great post!", post: post1, user: user2)
comment2 = Comment.create(content: "Nice job!", post: post1, user: user3)
comment3 = Comment.create(content: "Interesting read.", post: post2, user: user1)
