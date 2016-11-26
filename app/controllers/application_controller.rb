class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user

  private

  def fetch_user
    @current_user = User.find_by id: session[:user_id]

    session[:user_id] = nil unless @current_user
  end

  def authorized_user
    if @current_user == nil
      flash[:error] = "You must be logged in to view this"
      redirect_to login_path
    end
  end
end
