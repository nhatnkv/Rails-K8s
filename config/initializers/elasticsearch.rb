Elasticsearch::Model.client = Elasticsearch::Client.new(
  host: ENV['DATABASE_HOST'] || Rails.application.credentials.elasticsearch.host,
  log: true,
  user: ENV['DATABASE_USERNAME'] || Rails.application.credentials.elasticsearch.user,
  password: ENV['DATABASE_PASSWORD'] || Rails.application.credentials.elasticsearch.password
)
