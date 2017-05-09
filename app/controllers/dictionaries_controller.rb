class DictionariesController < ApplicationController
  before_action :load_dictionary, only: [:show, :destroy]

  def index
    render json: current_user.dictionaries
  end

  def show
    render json: @dictionary
  end

  def create
    Dictionary.create!(locator: params[:locator], user: current_user)
    head :no_content
  end

  def destroy
    @dictionary.destroy
    head :no_content
  end
end
