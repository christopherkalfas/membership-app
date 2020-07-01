class ApplicationController < ActionController::Base

    private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def authorize
  redirect_to login_url, alert: "Not authorized" if current_user.nil?
end

def authenticate!
  unless current_user
    flash[:info] = "You have to be logged in to do that!"
    redirect_to login_path
  end
end

def authentication_required
  if !logged_in?
    redirect_to login_path
  end
end

def logged_in?
  session[:user_id]
end

def current_user?(user)
  user == current_user
end
helper_method :current_user
helper_method :current_user?
helper_method :logged_in?
end
