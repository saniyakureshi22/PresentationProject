# frozen_string_literal: true

# CategoriesController handles CRUD operations for categories.
class Category < ApplicationRecord
  belongs_to :user
end
