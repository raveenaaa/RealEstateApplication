class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy]

  # GET /realtors
  # GET /realtors.json
  def index
    @realtors = Realtor.all
  end

  # GET /realtors/1
  # GET /realtors/1.json
  def show
  end

  # GET /realtors/new
  def new
    @realtor = Realtor.new
  end

  # GET /realtors/1/edit
  def edit
  end

  # POST /realtors
  # POST /realtors.json
  def create
    @realtor = Realtor.includes(:company).new(realtor_params)

    respond_to do |format|
      if @realtor.save
        log_in @realtor, "Realtor"
        flash[:notice]  = 'Welcome @realtor.name!'
        format.html { redirect_to @realtor }
        format.json { render :show, status: :created, location: @realtor }
      else
        format.html { render :new }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /realtors/1
  # PATCH/PUT /realtors/1.json
  def update
    respond_to do |format|
      if @realtor.update(realtor_params)
        flash[:notice] = 'Your profile was updated!'
        format.html { redirect_to @realtor }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realtors/1
  # DELETE /realtors/1.json
  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to realtors_url, notice: 'Realtor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realtor_params
      params.require(:realtor).permit(:email, :name, :password, :phone, :company_id)
    end
end
