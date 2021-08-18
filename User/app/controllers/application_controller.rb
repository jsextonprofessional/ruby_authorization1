class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  private
  def require_login
    redirect_to '/sessions/new' unless current_user
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  # Prevents user from seeing users show page if not their own
  def require_authorization
    redirect_to "/users/#{current_user.id}" unless current_user.id == params[:id].to_i
  end
end
