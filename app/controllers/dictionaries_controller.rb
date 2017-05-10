class DictionariesController < ApplicationController
  before_action :load_dictionary, only: [:show, :destroy]
  before_action :owners_only, only: [:create, :destroy]

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
