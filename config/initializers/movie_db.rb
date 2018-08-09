require "dotenv/load"

Tmdb::Api.key(ENV['MOVIE_KEY'])
