class ApplicationController < ActionController::API
  def current_reader
    Reader.first || Reader.create(username: 'manolo')
  end
end
