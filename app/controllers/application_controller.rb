class ApplicationController < ActionController::API
  before_action :current_user, :load_user

  rescue_from ActiveRecord::RecordInvalid do |exception|
    throw_json_exception(exception, status: :unprocessable_entity)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    throw_json_exception(exception, status: :not_found)
  end

  def current_user
    User.find_by_token!(request.headers['Authorization'])
  end

  def owners_only
    head :unauthorized unless current_user.id == @user.id
  end

  def load_user(username: params[:username])
    @user = User.find_by_username!(username)
  end

  def load_dictionary(locator: params[:id], user: @user)
    @dictionary = user.dictionaries.find_by_locator!(locator)

    head :unauthorized unless @dictionary.viewable_by?(current_user)
  end

  def load_translation(id: params[:id], dictionary: @dictionary)
    @translation = dictionary.translations.find(id)
  end

  private

  def throw_json_exception(exception, status: :ok)
    render json: { error: exception.message }, status: status
  end
end
