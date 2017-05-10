class SearchController < ApplicationController
  def search
    render json: Translation.search(params[:search_terms]).results
  end
end
