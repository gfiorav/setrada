require 'test_helper'

class AuthControllerTest < ActionDispatch::IntegrationTest
  setup do
    @password = '123456'.freeze
    @user = create_user(password: @password)
  end

  teardown do
    @password = nil
    @user.destroy
  end

  test 'username is required' do
    post '/login', params: { password: @password }

    assert_response :not_found
  end

  test 'password is required' do
    post '/login', params: { username: @user.username }

    assert_response :unauthorized
  end

  test 'password validation' do
    post '/login', params: { username: @user.username, password: random_string }

    assert_response :unauthorized
  end

  test 'returns proper token' do
    post '/login', params: { username: @user.username, password: @password }

    assert_response :success
    assert_equal JSON.parse(@response.body)['auth_token'], @user.reload.token
  end

  test 'regenerates tokens on every login' do
    post '/login', params: { username: @user.username, password: @password }

    assert_response :success
    first_token = @user.reload.token
    assert_equal JSON.parse(@response.body)['auth_token'], first_token

    post '/login', params: { username: @user.username, password: @password }

    assert_response :success
    second_token = @user.reload.token
    assert_equal JSON.parse(@response.body)['auth_token'], second_token

    assert_not_equal first_token, second_token
  end
end
