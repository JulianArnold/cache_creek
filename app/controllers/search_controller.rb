class SearchController < ApplicationController
  def index
    @search_results = SearchEngine.new(params[:search_term]).search_now
  end
end
