class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:
      params[:session][:email].downcase)
      if user &&
        user.authenticate(params[:session][:password])
        log_in user
        flash[:success] = "Welcome back! (^_^) "
        redirect_to user
      else
        flash[:danger] = "Login failed (X_X) "
        render 'new'
      end
  end

  def destroy
    log_out
    flash[:success] = "Good bye! (^_^)/"
    redirect_to root_url
  end
end
