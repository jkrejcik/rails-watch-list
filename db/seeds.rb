# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

puts "Cleaning database"
Movie.destroy_all

puts "Scraping top 20 movies to db"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies = URI.open(url).read
data = JSON.parse(movies)

data["results"].each do |movie|
  new_movie = Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: movie["poster_path"],
    rating: movie["vote_average"]
  )
  puts "#{new_movie.id} - #{new_movie.title} - created!"
end

puts "Finished"
