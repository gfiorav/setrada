class Dictionary < ApplicationRecord
  belongs_to(:reader)
  has_many(:translations)
end
