class ApplicationController < ActionController::API
  def current_reader
    Reader.first || Reader.create(username: 'manolo')
  end

  def load_dictionary(id: params[:id])
    @dictionary = Dictionary.find(id)
  rescue ActiveRecord::RecordNotFound => _exception
    render json: 'Dictionary not found', status: :not_found
  end

  def load_translation(id: params[:id])
    @translation = Translation.find(id)
  rescue ActiveRecord::RecordNotFound => _exception
    render json: 'Translation not found', status: :not_found
  end
end
