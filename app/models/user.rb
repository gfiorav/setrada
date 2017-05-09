class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many(:dictionaries)

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, null: false

  DEFAULT_TOKEN_LIFESPAN_IN_SECONDS = 86_400

  private

  def token_expired?
    (Time.now - updated_at) >= DEFAULT_TOKEN_LIFESPAN_IN_SECONDS
  end
end
