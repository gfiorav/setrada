class AuthController < ApplicationController
  skip_before_action :current_reader, only: :create

  def create
    reader = Reader.find_by_username!(params[:username])
    if reader.authenticate(params[:password])
      reader.regenerate_token
      render json: { auth_token: reader.token }
    else
      render json: { errors: 'invalid reader credentials' },
             status: :unauthorized
    end
  end
end
