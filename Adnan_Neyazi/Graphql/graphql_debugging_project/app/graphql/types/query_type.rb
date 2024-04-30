# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :hello, String, null: false, description: "An example field added by the generator"
    field :users, [UserType], null: false, description: "Get all users"
    field :posts, [PostType], null: false, description: "Get all posts"

    def users
      User.all
    end

    def posts
      Post.all
    end
    
    def hello
      "world"
    end
  end
end
