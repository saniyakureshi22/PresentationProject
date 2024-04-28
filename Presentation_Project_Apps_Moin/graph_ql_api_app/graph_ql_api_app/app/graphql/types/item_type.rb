module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :image_url, String, null: true
    field :artist, Types::ArtistType, null: true  # Define the artist field
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Define a resolver method for the 'artist' field
    def artist
      # Here, you can implement the logic to fetch the associated artist for this item
      # For example, if you have an 'artist_id' field in your 'Item' model, you can do:
      # Item.find(object.id).artist
      # This assumes you have a proper association set up in your ActiveRecord models
      # Adjust this logic based on your specific implementation
      Item.find(object.id).artist
    end
  end
end
