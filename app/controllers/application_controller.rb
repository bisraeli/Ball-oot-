class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_current_user

  private
  def load_current_user
    @current_user ||= Player.find(1)
  end
end

#might have to modify to ||= Player.find(session[:user_id]) if session[:user_id]