class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authorize!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    unless current_user
      redirect_to root_path
    end
  end
end
