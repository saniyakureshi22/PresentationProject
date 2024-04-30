# frozen_string_literal: true

# User represents a registered user in the system.
class User < ApplicationRecord
  has_many :customers
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
  
end
