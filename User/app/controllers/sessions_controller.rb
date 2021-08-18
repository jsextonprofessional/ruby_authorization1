class SessionsController < ApplicationController
  
  skip_before_action :require_login, except: [:destroy]

  def new
    #render login page
  end

  def create
    puts 'login user'
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
    end
  end

  def destroy
    session.clear
    redirect_to '/sessions/new'
  end
end
