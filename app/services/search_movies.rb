class SearchMovies
  def perform(title)
    @search = Tmdb::Search.new
    @search.resource('movie') # determines type of resource
    @search.query(title) # the query to search against
    @search.fetch.first(20) # makes request
  end
end
