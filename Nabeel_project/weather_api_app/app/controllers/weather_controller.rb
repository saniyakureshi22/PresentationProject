# app/controllers/weather_controller.rb
class WeatherController < ApplicationController
  def index
    search_weather_for = params[:city] || params[:country] || params[:state]
    if search_weather_for.present?
      weather_data = WeatherService.fetch_weather(search_weather_for)
      if weather_data
        render json: weather_data
      else
        render json: { error: 'Weather data not found' }, status: :not_found
      end
    else
      render json: { error: 'Parameter missing' }, status: :bad_request
    end
  end
end
