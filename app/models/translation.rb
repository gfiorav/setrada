class Translation < ApplicationRecord
  include Elasticsearch::Model,
          Elasticsearch::Model::Callbacks

  belongs_to :dictionary

  validates :map, :locator, presence: true
end
