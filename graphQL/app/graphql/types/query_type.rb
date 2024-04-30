# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    graphql_name 'Query'
    description 'The query root of this schema'

    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end
    
    def node(id:)
      context.schema.object_from_id(id, context)
    end
    
    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end
    
    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end
    
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    
    # TODO: remove me
    field :test_field, String, null: false,
    description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
    
    field :blog, Types::BlogType, null: false, description: "Fetch blog for a given ID" do
      argument :id, ID, required: true
    end
    
    # @param id [ID] The ID of the blog to fetch
    # @return [Blog, nil] The blog with the given ID, or nil if not found
    def blog(id:)
      Blog.find_by(id: id)
    rescue ActiveRecord::RecordNotFound
      nil
    end

    field :blogs, [Types::BlogType], null: true, description: "Fetches all the blogs"
    def blogs
      Blog.all # for fetching all blogs.
    end
  end
end
