
Query uesd to fetch the data
=================== query for finding all blogs data ================== 

{ 
  blogs {
    id
    title
    userId
    userName
    createdAt
  }
}



=================== query for finding all users data ================== 

{
  users {
    id
    firstName
    email
    createdAt
    blogs {
      id
      title
      description
    }
  }
}


===================== query for finding blog data by id ===========================
query getBlog($id: ID!){
  blog(id: $id){
    title
    description
    userId
    userName
    
  }
}


===================== query for finding user data by id ===========================

query getUser($id: ID!){
  user(id: $id){
    id
    email
    blogs {
      id
      title
      description
    }
  }
}

================== type generator command ==============

rails g graphql:object blog




============================================================================

Mutation used to maniulate the data in a database 

Create a mutation

it will create a mutation file to create a blog in the database
rails g graphql:mutation_create blog





rapid api key : 64a3e24284msh931466c07088639p1100c2jsn8b32233c3993


require 'uri'
require 'net/http'

url = URI("https://google-translate1.p.rapidapi.com/language/translate/v2/detect")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/x-www-form-urlencoded'
request["Accept-Encoding"] = 'application/gzip'
request["X-RapidAPI-Key"] = '64a3e24284msh931466c07088639p1100c2jsn8b32233c3993'
request["X-RapidAPI-Host"] = 'google-translate1.p.rapidapi.com'
request.body = "q=English%20is%20hard%2C%20but%20detectably%20so"

response = http.request(request)
puts response.read_body






require 'uri'
require 'net/http'

url = URI("https://google-translate1.p.rapidapi.com/language/translate/v2")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/x-www-form-urlencoded'
request["Accept-Encoding"] = 'application/gzip'
request["X-RapidAPI-Key"] = '64a3e24284msh931466c07088639p1100c2jsn8b32233c3993'
request["X-RapidAPI-Host"] = 'google-translate1.p.rapidapi.com'
request.body = "q=Hello%2C%20world!&target=es&source=en"

response = http.request(request)
puts response.read_body




require 'uri'
require 'net/http'

url = URI("https://google-translate1.p.rapidapi.com/language/translate/v2/languages")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Accept-Encoding"] = 'application/gzip'
request["X-RapidAPI-Key"] = '64a3e24284msh931466c07088639p1100c2jsn8b32233c3993'
request["X-RapidAPI-Host"] = 'google-translate1.p.rapidapi.com'

response = http.request(request)
puts response.read_body



# app/services/translation_service.rb
class LanguageService
  include HTTParty
  base_uri 'https://google-translate1.p.rapidapi.com/language/translate/v2'

  def initialize; end

  def translate(text, target_language, source_language = nil)
    headers = {
      "X-RapidAPI-Key" => '64a3e24284msh931466c07088639p1100c2jsn8b32233c3993',
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
end


cmd_tuples is a method specific to the PG::Result object returned by the execute method when using the PostgreSQL adapter. 
It indicates the number of rows affected by the SQL command.