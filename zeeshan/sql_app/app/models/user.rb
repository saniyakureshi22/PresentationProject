class User < ApplicationRecord
	has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
end
