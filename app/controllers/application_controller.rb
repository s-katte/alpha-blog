class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# To make know the rails that these are helper and used in views
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to do this aciton"
      redirect_to root_path
    end
  end
end
