# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = "http://tmdb.lewagon.com/movie/top_rated"
response = HTTParty.get(url)
results = response.parsed_response["results"]

results.each do |result|
  Movie.create!(title: result["original_title"], overview: result["overview"], poster_url: result["poster_path"], rating: result["vote_average"].to_i)
end
