class SearchController < ApplicationController
  skip_before_action :load_user

  def search
    render json: Translation.search(params[:search_terms]).results
  end
end
