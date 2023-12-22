# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
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


    # 1 - Adding users
    field :users, [Types::UserType], null: false

    # 1.1 Users Query
    def users
      User.all
    end

    # 2 - Adding one user
    field :user, Types::UserType, null: false,
         description: "Список пользователей" do
      # Passing arguemts used to identify user
      argument :id, ID, required: true, description: 'Код пользователя'
    end

    # 2.1 - User Query
    def user(id:)
      User.find(id)
    end

    #--------------

    field :items,
      [Types::ItemType],
      null: false,
      description: "Return a list of items"

    def items
      Item.all
    end

    field :artists, [Types::ArtistType.connection_type]

    def artists
      byebug
      Artist.all
    end

  end
end
