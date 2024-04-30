class Api::V1::ApiRequestsController < ApplicationController
	require 'httparty'

  def customers
    response = HTTParty.get('http://localhost:3000/api/v1/customers/')
 
    render json: response.body
  end

  def categories
    response = HTTParty.get('http://localhost:3000/api/v1/categories/')
    
    render json: response.body
  end
  
end
