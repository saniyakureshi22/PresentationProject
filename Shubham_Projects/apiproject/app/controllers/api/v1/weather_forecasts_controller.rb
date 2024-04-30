module Api
  module V1
    class WeatherForecastsController < ApplicationController
      def index
        api_key = ENV['3bd05f2c7cbe73fa606e2ecb59c33da2']
        city_name = params[:city_name]
        response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city_name}&appid=#{api_key}&units=metric")
        data = JSON.parse(response.body)

        if data['cod'] == 200
          temperature = data['main']['temp'] if data['main']
          description = data['weather'][0]['description'] if data['weather'] && data['weather'][0]

          if temperature && description
            render json: {
              temperature: temperature,
              description: description
            }
          else
            render json: { error: 'Temperature or description not found in the API response' }, status: :not_found
          end
        else
          render json: { error: 'City not found or API error' }, status: :not_found
        end
      rescue JSON::ParserError
        render json: { error: 'Failed to parse API response' }, status: :bad_request
      end
    end
  end
end
