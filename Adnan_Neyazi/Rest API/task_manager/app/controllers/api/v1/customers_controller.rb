# frozen_string_literal: true

# app/controllers/api/v1/customers_controller.rb
module Api
  module V1
    # Controller for managing customers in API version 1.
    class CustomersController < ApplicationController
      before_action :set_customer, only: %i[show update destroy]

      # GET /api/v1/customers
      def index
        @customers = Customer.page(params[:page]).per(5)
        render json: @customers
      end

      private

      # Only allow a list of trusted parameters through.
      def customer_params
        params.require(:customer).permit(:name, :email, :phone, :address, :user_id)
      end
    end
  end
end
