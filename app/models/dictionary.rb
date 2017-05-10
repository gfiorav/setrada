class Dictionary < ApplicationRecord
  include Elasticsearch::Model,
          Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :translations

  validates :locator, null: false
  validates :locator, uniqueness: { scope: :user_id }
end
