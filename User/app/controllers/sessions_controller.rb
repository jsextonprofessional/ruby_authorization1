class SessionsController < ApplicationController
  
  skip_before_action :require_login, except: [:destroy]

  def new
    #render login page
  end

  def create
    puts 'login user'
    session[:user_id] = 1
    redirect_to '/users/:id'
  end

  def destroy
    session.clear
    redirect_to '/sessions/new'
  end
end
