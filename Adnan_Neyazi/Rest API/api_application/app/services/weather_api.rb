class WeatherApi
  API_KEY = '03538b4596c645fed4df00c6d82d63c7'
  BASE_URL = 'https://api.openweathermap.org/data/2.5/weather'

  def fetch_weather(city)
    url = "#{BASE_URL}?q=#{city}&appid=#{API_KEY}&units=metric"
    response = HTTParty.get(url)
    response.body
    raise "API Error: #{response.code}" unless response.success?
    response.parsed_body
  end
end
