class ApplicationController < ActionController::API
  before_action :current_reader

  rescue_from ActiveRecord::RecordInvalid do |exception|
    throw_json_exception(exception, status: :unprocessable_entity)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    throw_json_exception(exception, status: :not_found)
  end

  def current_reader
    Reader.find_by_token!(request.headers['Authorization'])
  end

  def load_dictionary(id: params[:id])
    @dictionary = Dictionary.find(id)
  end

  def load_translation(id: params[:id], dictionary: @dictionary)
    @translation = dictionary.translations.find(id)
  end

  private

  def throw_json_exception(exception, status: :ok)
    render json: { error: exception.message }, status: status
  end
end
