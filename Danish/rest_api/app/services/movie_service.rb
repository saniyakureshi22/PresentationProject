# app/services/movie_service.rb
class MovieService
  include HTTParty
  base_uri 'http://www.omdbapi.com'

  def initialize
    @options = { query: { apikey: 'db50d252' } }
  end

  def search_movies(query)
    debugger
    @options[:query][:s] = query
    response = self.class.get('/', @options)
    return [] unless response.success?

    response['Search']
  end

  def get_movie_details(imdb_id)
    @options[:query][:i] = imdb_id
    response = self.class.get('/', @options)
    return {} unless response.success?

    response.parsed_response
  end
end
