class SessionsController < ApplicationController
  def new
  end

  def create
    role = params[:session][:role]

    if role == 'Realtor'
    user = Realtor.find_by(email: params[:session][:email].downcase)
    else if role == 'House Hunter'
      user = HouseHunter.find_by(email: params[:session][:email].downcase)
      else if role == 'Admin'
             user = Admin.find_by(email: params[:session][:email].downcase)
           end
      end
    end

      if user  && user.authenticate(params[:session][:password])
        log_in user,role
        redirect_to current_user
      else
        flash.now[:danger] = "Invalid email/password"
        render 'new'
        end
     end

  def destroy
    log_out
    redirect_to '/home'
  end
end

