# app/controllers/api/queries_controller.rb

module Api
  class QueriesController < ApplicationController
  	skip_before_action :verify_authenticity_token

    def execute
      query = params[:query]
      result = ActiveRecord::Base.connection.execute(query)
      render json: result
    end

    def fetch_all_users
      query = 'SELECT * FROM users;'
      result = ActiveRecord::Base.connection.execute(query)
      render json: result
    end
  end
end
