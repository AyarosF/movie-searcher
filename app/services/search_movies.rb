class SearchMovies
	def perform(a)
      @search = Tmdb::Search.new
      @search.resource('movie') # determines type of resource
      @search.query(a) # the query to search against
      @search.fetch # makes request
  end
end
