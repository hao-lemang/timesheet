class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to login_path, alert: 'You must be logged in to access this page.' unless current_user
  end

  def authorize_parent_user!
    redirect_to user_time_sheets_path(current_user), alert: "You're not authorized to view this page." unless params[:user_id].to_i == current_user.id
  end
end
