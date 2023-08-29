class ApplicationRecord < ActiveRecord::Base
  Elasticsearch::Model.client = Elasticsearch::Client.new(host: 'elasticsearch', log: true)

  primary_abstract_class
end
