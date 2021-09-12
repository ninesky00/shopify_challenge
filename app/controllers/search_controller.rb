class SearchController < ApplicationController
  def index
    @images = Image.search(params[:query])
    # binding.pry
  end
end
