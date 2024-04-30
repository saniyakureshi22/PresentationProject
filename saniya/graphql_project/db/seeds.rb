# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

allama_iqbal = Artist.create!(
  email: "allama_iqbal@example.com",
  first_name: "Allama",
  last_name: "Iqbal"
)

Item.create!(
  [
    {
      title: "Shikwa",
      description: "Written by Allama Iqbal Shikwa, was published published in 1909",
      artist: allama_iqbal
    },
    {
      title: "Jawab-e-shikwa",
      description: "Jawab-e-Shikwa(Response to complaint) was published in 1913",
      artist: allama_iqbal
    },
    {
      title: "Bang-e-dara",
      description: "The book is named The call of the Marching Bell [Bang-e-Dara].",
      artist: allama_iqbal
    },
    {
      title: "Bal-e-Jibril	",
      description: "Baal-e-Jibril (Urdu: بال جبریل; or Gabriel's Wing; published in Urdu, 1935) is a philosophical poetry book by Allama Muhammad Iqbal,",
      artist: allama_iqbal
    }
  ]
  )