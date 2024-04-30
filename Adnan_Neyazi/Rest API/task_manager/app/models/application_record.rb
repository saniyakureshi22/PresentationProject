# frozen_string_literal: true

# ApplicationRecord serves as the base class for all models in the application.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
