class MoviesController < ApplicationController
  def search
    @movies = SearchMovies.new.perform(params[:movie])
    @titles = []
    @releases = []
    @directors = []
    @images = []
    @movies.each do |movie|
      @titles << movie['title']
      sleep(0.2)
      @releases << movie['release_date']
      @images << "http://image.tmdb.org/t/p/w185#{movie['poster_path']}"
      sleep(0.2)
      begin
        Tmdb::Movie.credits(movie['id'])['crew'].find {|x| x['job'] == 'Director'}['name'].nil? || Tmdb::Movie.credits(movie['id'])['crew'].find {|x| x['job'] == 'Director'}['name'].empty?
      rescue NoMethodError, StandardError => e
        @directors << "une personne non renseignée"
        next
      end
        @directors << Tmdb::Movie.credits(movie['id'])['crew'].find{|x| x['job'] == 'Director'}['name']
    end
  end
end
