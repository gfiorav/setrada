class Reader < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many(:dictionaries)

  validates(:username, uniqueness: { case_sensitive: false })
end
