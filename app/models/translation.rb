class Translation < ApplicationRecord
  belongs_to(:dictionary)

  validates :map, presence: true
end
