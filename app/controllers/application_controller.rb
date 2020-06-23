class ApplicationController < ActionController::Base

    private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

def authorize
  redirect_to login_url, alert: "Not authorized" if current_user.nil?
end

def current_group
    @current_user.owned_groups
end 
end
