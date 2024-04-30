# db/seeds.rb

require 'faker'

# Define the number of fake customers you want to generate
num_customers = 3

num_customers.times do
  Customer.create!(
    username: Faker::Internet.username,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    gender: Faker::Gender.binary_type,
    occupation: Faker::Job.title,
    company: Faker::Company.name,
    interests: Faker::Lorem.paragraph(sentence_count: 3),
    age: Faker::Number.between(from: 18, to: 65),
    subscription_plan: Customer.enum.keys.sample
  )
end

puts "#{num_customers} fake customers created!"
