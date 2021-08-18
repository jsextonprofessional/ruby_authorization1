class UsersController < ApplicationController

  skip_before_action :require_login, only: [:index]
  before_action :require_authorization

  
  def index
  
  end

  def show
      @user = User.find(params[:id])
  end
end
