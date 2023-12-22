# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'Пользователь'

    field :id, ID, null: false,  description: "Код"
    field :name, String, description: "Наименование"
    field :email, String, description: "Эл. адрес"
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Время создания"
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false, description: "Время изменения"

    field :posts_count, Integer, null: true, description: "Кол-во постов"
    field :posts, [Types::PostType], description: "Список постов"

    # Typical rails method returning the count
    # of total posts for each user
    def posts_count
      object.posts.size
    end
  end
end
