class Dictionary < ApplicationRecord
  belongs_to(:user)
  has_many(:translations)

  validates :namespace, uniqueness: { scope: :user_id }
end
