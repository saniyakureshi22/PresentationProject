# frozen_string_literal: true

# Customer represents a user/customer in the system.
class Customer < ApplicationRecord
  belongs_to :user
end
