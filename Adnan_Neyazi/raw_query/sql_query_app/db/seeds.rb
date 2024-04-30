# db/seeds.rb

# Delete existing users
User.delete_all

# Create sample users
user1 = User.create(name: 'Johny Doooeee', age: 20)
user2 = User.create(name: 'John Doe', age: 25)
User.create(name: 'Jane Smith', age: 35)
User.create(name: 'Alice Johnsonnnn', age: 30)
User.create(name: 'Alice Johnson', age: 40)

Order.create(user: user1, product: 'Product A', quantity: 2)
Order.create(user: user1, product: 'Product B', quantity: 3)
Order.create(user: user2, product: 'Product C', quantity: 1)

