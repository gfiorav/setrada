class ApplicationController < ActionController::API
  def current_reader
    Reader.first || Reader.create(username: 'manolo')
  end

  def load_dictionary(id: params[:id])
    @dictionary = Dictionary.find(id)
  rescue ActiveRecord::RecordNotFound => _exception
    head :not_found
  end
end
