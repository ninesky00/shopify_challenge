class SearchController < ApplicationController
  def index
    @images = Image.search_characteristics(params[:query])
    # binding.pry
  end
end
