# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Define an array of Indian names
# indian_names = [
#   "Aarav", "Vihaan", "Vivaan", "Ananya", "Pari", "Kiara", "Aaradhya", "Advik", "Aryan", "Reyansh",
#   "Saisha", "Ishaan", "Kabir", "Saanvi", "Aadya", "Sara", "Aarush", "Aahana", "Anvi", "Aryan"
# ]

# # Define an array of profiles
# profiles = [
#   "Front-end Developer", "Back-end Developer", "Full-stack Developer", "UI/UX Designer", "Data Analyst"
# ]

# # Create 20 records with random Indian names and profiles
# 20.times do
#   Employee.create!(
#     employee_id: SecureRandom.hex(5),
#     name: indian_names.sample,
#     profile: profiles.sample,
#     salary: rand(50000..150000)
#   )
# end
indian_names = [
  "Aarav", "Vihaan", "Vivaan", "Ananya", "Pari", "Kiara", "Aaradhya", "Advik", "Aryan", "Reyansh",
  "Saisha", "Ishaan", "Kabir", "Saanvi", "Aadya", "Sara", "Aarush", "Aahana", "Anvi", "Aryan"
]

# Insert 20 demo records with Indian names
20.times do
  Employee.create!(
    employee_id: SecureRandom.hex(5),
    name: indian_names.sample,
    profile: ["Front-end Developer", "Back-end Developer", "Full-stack Developer"].sample,
    salary: rand(50000..150000)
  )
end
