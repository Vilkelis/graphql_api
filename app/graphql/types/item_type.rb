# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :image_url, String
    field :artist, Types::ArtistType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def artist
      dataloader.with(GraphQL::Sources::ActiveRecordObject, ::Artist, key: :id).load(object.artist_id)
    #  Artist.find(object.artist_id)
    end
  end
end
