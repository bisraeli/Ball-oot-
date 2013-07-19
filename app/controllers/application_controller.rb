class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_authentication

  def check_authentication
    not_authenticated unless logged_in?
  end

  def not_authenticated
    session[:return_to_url] = request.fullpath
    redirect_to log_in_path
  end

  #before_filter :load_current_user

  #private
  #def load_current_user
   # @current_user ||= Player.find(1)
  #end
end

#might have to modify to ||= Player.find(session[:user_id]) if session[:user_id]