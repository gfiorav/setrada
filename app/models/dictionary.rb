class Dictionary < ApplicationRecord
  include Elasticsearch::Model,
          Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many :translations

  PUBLIC = 0
  PRIVATE = 1
  PRIVACY_DICTIONARY = { PUBLIC => 'public', PRIVATE => 'private' }.freeze

  validates :locator, :privacy, null: false
  validates :locator, uniqueness: { scope: :user_id }
  validates :privacy, inclusion: { in: PRIVACY_DICTIONARY.keys }

  def viewable_by?(user)
    public? || user_id == user.id
  end

  private

  def public?
    privacy.zero?
  end
end
