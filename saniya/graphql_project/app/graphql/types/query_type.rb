# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
      include GraphQL::Types::Relay::HasNodesField
  
      field :items, 
      [Types::ItemType],
      null: false, 
      description: "Return a list of items"
  
      def items
        Item.all
      end 

      field :artists, 
      [Types::ArtistType],
      null: false, 
      description: "Return a list of artists"
  
      def artists
        Artist.all
      end 
    
  end
end
