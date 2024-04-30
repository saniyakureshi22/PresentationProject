# app/controllers/api/queries_controller.rb

module Api
  module V1
    class QueriesController < ApplicationController
      skip_before_action :verify_authenticity_token

      def users
        query = 'SELECT * FROM users;'
        result = ActiveRecord::Base.connection.execute(query)
        render json: result
      end

      def users_by_age
        min_age = params[:min_age] || 0
        query = "SELECT id,age FROM users WHERE age >= #{min_age};"
        result = ActiveRecord::Base.connection.execute(query)
        render json: result
      end

      def users_by_name
        query = "SELECT id,name FROM users WHERE name LIKE 'A%';"
        result = ActiveRecord::Base.connection.execute(query)
        render json: result
      end

    end
  end
end
