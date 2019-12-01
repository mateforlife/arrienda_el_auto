class SearchController < ApplicationController
  def index
    @brands = Brand.brand_search(params[:search].capitalize)
  end
end