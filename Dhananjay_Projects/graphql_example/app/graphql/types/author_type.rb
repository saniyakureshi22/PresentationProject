module Types
    class AuthorType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :books, [BookType], null: true
    end
  end
  