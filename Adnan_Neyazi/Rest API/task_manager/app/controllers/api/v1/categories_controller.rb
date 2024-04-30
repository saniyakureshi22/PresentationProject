# frozen_string_literal: true

# app/controllers/api/v1/categories_controller.rb
module Api
  module V1
    # Controller for managing categories in API version 2.
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show update destroy]

      def index
        @categories = Category.page(params[:page]).per(5)
        render json: @categories
      end

      private

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :description, :user_id)
      end
    end
  end
end
