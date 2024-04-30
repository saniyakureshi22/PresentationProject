# app/services/language_service.rb
class LanguageService
  include HTTParty
  base_uri 'https://google-translate1.p.rapidapi.com/language/translate/v2'

  def initialize; end

  def translate(text, target_language, source_language = nil)
    headers = {
      "X-RapidAPI-Key" => ENV['rapid_api_key'], # Enter your rapid api key
      "X-RapidAPI-Host" => 'google-translate1.p.rapidapi.com',
      "Content-Type" => 'application/x-www-form-urlencoded',
      "Accept-Encoding" => 'application/gzip'
    }
    
    body = {
      q: text,
      target: target_language,
      source: source_language
    }

    response = self.class.post("", headers: headers, body: body)
    response.parsed_response
  end

  def fetch_languages
    headers = {
      "X-RapidAPI-Key" => ENV['rapid_api_key'], # Enter your rapid api key
      "X-RapidAPI-Host" => 'google-translate1.p.rapidapi.com',
      "Accept-Encoding" => 'application/gzip'
    }

    response = self.class.get("/languages", headers: headers)
    response.parsed_response
  end
end
