require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'username presence' do
    assert_raises(ActiveRecord::NotNullViolation) do
      create_user(username: nil)
    end
  end

  test 'password presence' do
    assert_raises(ActiveRecord::RecordInvalid) do
      create_user(password: nil)
    end
  end

  test 'username uniqueness' do
    random_username = random_string
    create_user(username: random_username)

    assert_raises(ActiveRecord::RecordInvalid) do
      create_user(username: random_username)
    end
  end
end
