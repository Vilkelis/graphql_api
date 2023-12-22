Rails.application.config.graphql.tap do |config|
  # Максимальный уровень вложенности запроса GraphQL
  config.max_depth = 10
end
