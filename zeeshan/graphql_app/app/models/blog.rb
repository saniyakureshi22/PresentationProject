class Blog < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  before_save :unique_blog_for_user

  private
  def unique_blog_for_user
    if user.blogs.exists?(title: title, description: description)
      errors.add(:base, "A blog with the same title and description already exists for this user")
      throw :abort
    end
  end
end
