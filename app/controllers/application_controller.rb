class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: exception, status: :unprocessable_entity
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: "#{exception.record.class} not found", status: :not_found
  end

  def current_reader
    Reader.first || Reader.create(username: 'manolo')
  end

  def load_dictionary(id: params[:id])
    @dictionary = Dictionary.find(id)
  end

  def load_translation(id: params[:id], dictionary: @dictionary)
    @translation = dictionary.translations.find(id)
  end
end
