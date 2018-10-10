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
    if logged_in?
    @realtor = Realtor.find_by(email: current_user.email)
      end
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
    val = realtor_params
    if val[:company_id].blank?
      val[:company_id] = 1
      @realtor = Realtor.includes(:company).new(val)
    else
    @realtor = Realtor.includes(:company).new(realtor_params)
    end
    respond_to do |format|
      if @realtor.save
        unless logged_in?
        log_in @realtor, "Realtor"
          flash[:notice] = "Welcome #{@realtor.name}"
        end
        format.html { redirect_to @current_user  }
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
    val = realtor_params
    if val[:company_id].blank?
      val[:company_id] = 1
     end
    respond_to do |format|
      if @realtor.update(val)
        flash[:notice] = 'Your profile was updated!'
        format.html { redirect_to @realtor }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_profile
    @realtor = Realtor.find_by(id: current_user.id)
        @realtor.update_attribute(:company_id, params[:company_id])
    redirect_to @realtor
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
      params.require(:realtor).permit(:email, :name, :password, :phone, :company_id, :password_confirmation)
    end
end
