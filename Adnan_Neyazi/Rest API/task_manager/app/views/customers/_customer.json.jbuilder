# frozen_string_literal: true

json.extract! customer, :id, :name, :email, :phone, :address, :user_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
