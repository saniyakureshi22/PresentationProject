class Api::V1::WeatherController < ApplicationController
  require 'httparty'

  def show
    city = params[:city]
    weather_data = WeatherApi.new.fetch_weather(city)
    @temperature = weather_data['main']['temp']

    render json: response.body
  end

end