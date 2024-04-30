# app/controllers/api/v1/postal_pincode_controller.rb
module Api
  module V1
    class PostalPincodeController < ApplicationController
      def get_post_office_by_pincode
        pincode = params[:pincode]
        response = PostalPincodeApiService.get_post_office_by_pincode(pincode)
        render json: response
      end

      def get_post_office_by_branch_name
        branch_name = params[:branch_name]
        response = PostalPincodeApiService.get_post_office_by_branch_name(branch_name)
        render json: response
      end
    end
  end
end
