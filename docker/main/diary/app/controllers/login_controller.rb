class LoginController < ApplicationController
  before_action :need_not_login
  def index
  end
  def do_login
    user = User.find_by name: params[:username]
    unless user
      redirect_to action: 'index'
      return
    end
    unless user.authenticate(params[:password])
      redirect_to action: 'index'
      return
    end
    session[:user_id] = user.id
    redirect_to controller: 'top', action: 'index'
  end
  private
  def need_not_login
    redirect_to controller: 'top',
      action: 'index' if @current_user
  end
end
