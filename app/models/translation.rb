class Translation < ApplicationRecord
  belongs_to(:dictionary)

  validates :map, :locator, presence: true
end
