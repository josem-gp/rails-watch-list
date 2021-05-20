# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "rest-client"

puts "Deleting database..."

Movie.delete_all

puts "Calling API..."
response = RestClient.get "http://tmdb.lewagon.com/movie/top_rated"
repos = JSON.parse(response)
# => repos is an `Array` of `Hashes`.
repos['results'].each do |repo|
  movie = Movie.new(title: repo['original_title'],
                       overview: repo['overview'],
                       poster_url: repo['poster_path'],
                       rating: repo['vote_average'])
  puts "Created movie: #{repo['original_title']}"
  movie.save!
end

puts "Created all!"
