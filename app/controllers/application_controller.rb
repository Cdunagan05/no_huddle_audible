class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  http_basic_authenticate_with username: ENV['USERNAME'], password: ENV['PASSWORD'] 

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
