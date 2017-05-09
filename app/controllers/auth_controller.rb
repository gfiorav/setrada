class AuthController < ApplicationController
  skip_before_action :current_user, only: :create

  def create
    user = User.find_by_username!(params[:username])
    if user.authenticate(params[:password])
      user.regenerate_token
      render json: { auth_token: user.token }
    else
      render json: { error: 'invalid user credentials' },
             status: :unauthorized
    end
  end
end
