class SearchesController < ApplicationController

  def new
    @search = Search.new
    #@categories = House.uniq.pluck(:category)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:location, :min_price, :max_price, :min_area, :max_area)
  end
end