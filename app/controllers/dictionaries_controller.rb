class DictionariesController < ApplicationController
  before_action :load_dictionary, only: [:show, :destroy]

  def index
    render json: current_reader.dictionaries
  end

  def show
    render json: @dictionary
  end

  def create
    Dictionary.create!(locator: params[:locator], reader: current_reader)
    head :no_content
  end

  def destroy
    @dictionary.destroy
    head :no_content
  end
end
