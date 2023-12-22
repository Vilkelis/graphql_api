# frozen_string_literal: true

module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :email, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items, [Types::ItemType]
    field :full_name, String

    def full_name
      [object.first_name, object.last_name].compact.join("")
    end

    def items
     # dataloader.with(Sources::ActiveRecordObject, ::Item, key: :id).load(object.id)
      dataloader
        .with(GraphQL::Sources::ActiveRecordCollection, ::Item, key: :artist_id)
        .load(object.id)
    end
  end
end
