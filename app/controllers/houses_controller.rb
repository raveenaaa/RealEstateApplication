class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    #@houses = House.all
    @houses = House.where(nil) # creates an anonymous scope
    @houses = @houses.location(params[:location]) if params[:location].present?
    @houses = @houses.price(params[:price]) if params[:price].present?
    @houses = @houses.area(params[:area]) if params[:area].present?
  end

  def change

  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    @house = House.new
    if logged_in? && session[:role] == 'Realtor'
    @company = Company.find_by(id: current_user.company_id)
      end
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    val = house_params
    if session[:role] == 'Realtor'
    val[:company_id] = current_user.company_id
    end
    @house = House.includes(:company, :realtor).new(house_params)
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:location, :area, :year, :style, :price, :floors, :basement, :owner, :buyers, :company_id, :realtor_id, :name, :image)
    end
end
