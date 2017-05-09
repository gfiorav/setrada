require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  ActiveRecord::Migration.maintain_test_schema!

  # Add more helper methods to be used by all tests here...
  def random_string(lenght: 12)
    (0...lenght).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def create_user(username: random_string, password: random_string)
    User.create!(username: username, password: password)
  end

  def create_dictionary(user: create_user, locator: random_string)
    Dictionary.create!(user: user, locator: locator)
  end
end
