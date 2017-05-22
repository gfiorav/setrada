class AuthController < ApplicationController
  skip_before_action :current_user,
                     :load_user, only: :create

  def update
    user = User.find_by_username!(params[:username])

    if user.authenticate(params[:password])
      render json: { auth_token: user.token }
    else
      render json: { error: 'invalid user credentials' },
             status: :unauthorized
    end
  end
end
