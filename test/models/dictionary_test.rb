require 'test_helper'

class DictionaryTest < ActiveSupport::TestCase
  test 'locator presence' do
    assert_raises(ActiveRecord::NotNullViolation) do
      create_dictionary(locator: nil)
    end
  end

  test 'user presence' do
    assert_raises(ActiveRecord::RecordInvalid) do
      create_dictionary(user: nil)
    end
  end

  test 'locator uniqueness inside user scope' do
    user = create_user

    assert_raises(ActiveRecord::RecordInvalid) do
      previous_dictionary = create_dictionary(user: user)
      create_dictionary(user: user, locator: previous_dictionary.locator)
    end

    user.destroy
  end

  test 'locator duplication outside user scope' do
    one_user = create_user
    another_user = create_user
    same_locator = random_string

    create_dictionary(user: one_user, locator: same_locator)
    create_dictionary(user: another_user, locator: same_locator)

    one_user.destroy
    another_user.destroy
  end

  test 'valid privacies are accpeted' do
    Dictionary::PRIVACY_DICTIONARY.keys.each do |privacy|
      dictionary = create_dictionary(privacy: privacy)
      dictionary.destroy
    end
  end

  test 'invalid privacies are rejected' do
    assert_raises(ActiveRecord::RecordInvalid) do
      create_dictionary(privacy: -1)
    end
  end

  test 'null privacy not allowed' do
    assert_raises(ActiveRecord::RecordInvalid) do
      create_dictionary(privacy: nil)
    end
  end
end
