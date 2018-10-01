class SearchesController < ApplicationController
  def index
    @searches = Search.all
  end
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)
    @search.save
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:location, :min_price, :max_price, :min_area, :max_area)
  end
end