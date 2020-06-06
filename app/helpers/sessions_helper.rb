module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def headers
    if logged_in?
     return "header-user"
    else
     return "header-guest"
    end
  end
end
