require 'test_helper'

class DictionariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create_user
    @publicuser = create_user

    @public_dictionary = create_dictionary(user: @user)
    @private_dictionary = create_dictionary(user: @user,
                                            privacy: Dictionary::PRIVATE)
  end

  teardown do
    @user.destroy
    @publicuser.destroy
    @public_dictionary.destroy
    @private_dictionary.destroy
  end

  test 'public dictionaries can be viewed by anyone' do
    get dictionary_url(id: @public_dictionary.locator,
                       username: @user.username),
        params: {},
        headers: { 'Authorization' => @publicuser.token }

    assert_response :success
  end

  test 'private dictionaries can\'t be viewed by anyone' do
    get dictionary_url(id: @private_dictionary.locator,
                       username: @user.username),
        params: {},
        headers: { 'Authorization' => @publicuser.token }

    assert_response :unauthorized
  end

  test 'only owners can create dictionaries' do
    post dictionaries_url(username: @user.username),
         params: {},
         headers: { 'Authorization' => @publicuser.token }

    assert_response :unauthorized
  end

  test 'owners can create dictionaries' do
    locator = random_string

    post dictionaries_url(username: @user.username),
         params: { locator: locator },
         headers: { 'Authorization' => @user.token }

    assert_response :success

    @user.dictionaries.find_by_locator(locator)
  end

  test 'only owners can destroy dictionaries' do
    delete dictionary_url(id: @public_dictionary.locator,
                          username: @user.username),
           params: {},
           headers: { 'Authorization' => @publicuser.token }

    assert_response :unauthorized

    @user.dictionaries.find_by_locator!(@public_dictionary.locator)
  end

  test 'owners can destroy dictionaries' do
    delete dictionary_url(id: @public_dictionary.locator,
                          username: @user.username),
           params: {},
           headers: { 'Authorization' => @user.token }

    assert_response :no_content

    assert_raises(ActiveRecord::RecordNotFound) do
      @user.dictionaries.find_by_locator!(@public_dictionary.locator)
    end
  end
end
