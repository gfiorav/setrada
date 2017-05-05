class DictionariesController < ApplicationController
  before_filter :load_dictionary, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: exception, status: :unprocessable_entity
  end

  def index
    render json: current_reader.dictionaries
  end

  def show
    render json: @dictionary
  end

  def create
    Dictionary.create(locator: params[:locator], reader: current_reader)
    head :no_content
  end

  def destroy
    @dictionary.destroy
    head :no_content
  end
end
