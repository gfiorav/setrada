class User < ApplicationRecord
  has_secure_password
  has_secure_token

  has_many(:dictionaries)

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, null: false

  DEFAULT_TOKEN_LIFESPAN_IN_SECONDS = 86_400

  def token
    regenerate_token if token.blank? || token_expired?

    super
  end

  private

  def token_expired?
    (Time.now - updated_at) >= DEFAULT_TOKEN_LIFESPAN_IN_SECONDS
  end
end
