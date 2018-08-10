class SearchMovies
	def perform(title)
      @search = Tmdb::Search.new
      @search.resource('movie') # determines type of resource
      @search.query(title) # the query to search against
      @search.fetch # makes request
  end
end
