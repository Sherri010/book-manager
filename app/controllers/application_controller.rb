class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protect_from_forgery with: :exception

  # finds the current user for every request
  before_action :current_user

  private


  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def require_login
    if !current_user
      redirect_to root_path #halt's request cycle
    end
  end
end
