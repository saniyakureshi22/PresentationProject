module Types
    class BookType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :author, AuthorType, null: false
    end
  end