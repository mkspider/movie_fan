# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Admin.create!(
  id: '1',
  email: 'admin@admin',
  password: '202020',
)

10.times.each do |tmp|
  Movie.create([
                filmname: Faker::JapaneseMedia::StudioGhibli.movie,
                introduction: Faker::JapaneseMedia::StudioGhibli.quote
              ])
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

#users = []
10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
#  users.push(
    User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
#               )
end

#users[0].reviews.create_with_score(review: "楽しい！", title:"面白かった！")
