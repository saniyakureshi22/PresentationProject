# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/v1/categories', type: :request do
  path '/api/v1/categories' do
    get('list categories') do
      tags 'All Categories'
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
