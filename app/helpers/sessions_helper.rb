module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end
  
  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end

  def current_user?(user)
    user == current_user
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id:
      session[:user_id])
    end
  end

  def is_admin?
    if current_user.account_type == 1
      flash[:info] = "Hello Admin (>_<)// "
    else
      flash[:warning] = "Access Deninied (-_-) "
      redirect_to current_user
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
