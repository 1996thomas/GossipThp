# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#RESET DE LA BDD
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTagGossip.destroy_all
#ADD CITY
zip_code=["75012","65120","87984"]
10.times do
  city = City.create!(name: Faker::Address.city,zip_code: zip_code[(rand(0..2))])
end
#ADD USER
city = City.all
10.times do
  user = User.create!(first_name: Faker::Name.first_name,last_name: Faker::Name.last_name,description: Faker::Lorem.sentence(word_count: 10, random_words_to_add: 4),email: Faker::Internet.email ,age:rand(18..35),city: city[(rand(0..9))])
end
#ADD GOSSIP
user = User.all
20.times do
  gossip = Gossip.create!(title: Faker::Games::Pokemon.move,content:Faker::String.random(length: 10..50),user: user[(rand(0..9))])
end
#ADD TAG
20.times do
  tag = Tag.create!(title: "##{Faker::Creature::Animal.name}")
end
#JOIN TAG GOSSIP
gossip = Gossip.all
tag = Tag.all
gossip.each do |i|
  JoinTagGossip.create!(tag: tag[rand(0..19)], gossip: gossip[rand(0..19)])
end

  
# end

