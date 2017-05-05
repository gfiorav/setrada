class Reader < ApplicationRecord
  has_secure_password

  validates(:username, uniqueness: { case_sensitive: false })
end
