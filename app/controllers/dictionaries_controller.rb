class DictionariesController < ApplicationController
  before_filter :load_dictionary, except: [:create]

  private

  def load_dictionary
    Dictionary.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    head :not_found
  end
end
