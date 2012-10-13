class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #makes current_user accessible from the views
  helper_method :current_user


  #use this as a before filter on controllers
  def authorize
    redirect_to login_url, alert: "Not Authorized!" if current_user.nil?
  end
end
