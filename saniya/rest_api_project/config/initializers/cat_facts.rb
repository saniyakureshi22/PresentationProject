
CAT_FACTS_API_KEY = ENV['cat_facts_api_key']

module CatFacts
  class Client
    include HTTParty
    base_uri 'https://cat-fact.herokuapp.com'

    def initialize
      @options = { query: { apiKey: CAT_FACTS_API_KEY } }
    end

    def random_facts
      self.class.get("/facts/random", @options)
    end
  end
end
