class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    if logged_in?
    @realtor = Realtor.find_by(email: current_user.email)
    @inquiry = Inquiry.find_by(id: params[:inquiry])
      end
  end

  # GET /replies/new
  def new
    @reply = Reply.new
    @inquiry = Inquiry.includes(:house, :house_hunter).find_by(id: params[:inquiry_id])
    if logged_in?
    session[:inquiry_id] = params[:inquiry_id]
    @realtor = Realtor.find_by(email: current_user.email)
      end
  end

  # GET /replies/1/edit
  def edit
    if logged_in?
    @realtor = Realtor.find_by(email: current_user.email)
      end
  end

  # POST /replies
  # POST /replies.json
  def create
    val = reply_params
    val[:inquiry_id] = session[:inquiry_id]
    session.delete :inquiry_id
    if session[:role] == 'Admin'
      val[:realtor_id] = Realtor.find_by(email: current_user.email).id
    else
    val[:realtor_id] = current_user.id
    end
    @reply = Reply.includes(:inquiry, :realtor).new(val)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @reply, notice: "Reply created" }
        format.json { render :show, status: :created, location: @reply }
      else
        format.html { render :new }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply.destroy
    respond_to do |format|
      format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:message, :realtor_id, :inquiry_id)
    end
end
