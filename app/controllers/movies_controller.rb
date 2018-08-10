class MoviesController < ApplicationController
  def search
    @movies = SearchMovies.new.perform(params[:movie])
    @titles = []
    @releases = []
    @directors = []
    @images = []
    @movies.each do |movie|
      @titles << movie['title']
      @releases << movie['release_date']
      @images << "http://image.tmdb.org/t/p/w185#{movie['poster_path']}"
      @directors << Tmdb::Movie.credits(movie['id'])['crew'].find {|x| x['job'] == 'Director'}['name']
      rescue  StandardError => e
          @directors << "une personne non renseignée"
      end
  end
end
