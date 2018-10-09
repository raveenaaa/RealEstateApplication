class FavouritesController < ApplicationController
  before_action :set_favourite, only: [:show, :edit, :update, :destroy]

  # GET /favourites
  # GET /favourites.json
  def index
    @favourites = Favourite.all
  end

  # GET /favourites/1
  # GET /favourites/1.json
  def show
  end

   # GET /favourites/1/edit
  def edit
  end

  def potential_buyers
    @favourites = Favourite.where("house_id == ? " , "#{params[:house_id]}")
  end

   # POST /favourites
  # POST /favourites.json

  def add
    @favourite = Favourite.includes(:house, :house_hunter).new(house_hunter_id: params[:house_hunter_id] , house_id: params[:house_id])
    respond_to do |format|
      if @favourite.save
        format.html { redirect_to new_search_path, notice: 'Favourite was successfully created.' }
        format.json { render :show, status: :created, location: @favourite }
      else
        format.html { redirect_to houses_path }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourites/1
  # PATCH/PUT /favourites/1.json
  def update
    respond_to do |format|
      if @favourite.update(favourite_params)
        format.html { redirect_to @favourite, notice: 'Favourite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favourite }
      else
        format.html { render :edit }
        format.json { render json: @favourite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourites/1
  # DELETE /favourites/1.json
  def destroy
    @favourite.destroy
    respond_to do |format|
      format.html { redirect_to favourites_url, notice: 'Favourite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favourite_params
     params.fetch(:favourite, :house_hunter_id, :house_id)
      #params.require(:favourite).permit(:house_hunter_id, :house_id)
    end
end
