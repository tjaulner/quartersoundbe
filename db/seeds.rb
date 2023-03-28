# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create 10 fake users
(0..10).each do
    User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    phone: "1234567899", password: "password", username: Faker::Internet.username)
end

#create playlists
## - needs user (user_id) & playlist_name
## creating 20 playlists, but not all 15 users may end up with a playlist
(0..20).each do |i|
    faker_playlist_name = Faker::Hacker.noun.capitalize + " " + Faker::Hacker.verb.capitalize

    playlist = Playlist.new(user_id: rand(0..12), playlist_name: faker_playlist_name)
    playlist.save
end