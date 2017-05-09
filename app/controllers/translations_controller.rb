class TranslationsController < ApplicationController
  before_action { load_dictionary id: params[:dictionary_id] }
  before_action :load_translation, only: [:show, :update, :destroy]

  def index
    render json: @dictionary.translations
  end

  def show
    render json: @translation
  end

  def create
    Translation.create!(dictionary: @dictionary, map: params[:map])
    head :no_content
  end

  def update
    @translation.update_attributes!(map: params[:map])
    render json: @translation.reload
  end

  def destroy
    @translation.destroy
    head :no_content
  end
end
