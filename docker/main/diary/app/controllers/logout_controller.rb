class LogoutController < ApplicationController
  before_action :need_login
  def index
    session.delete(:user_id)
    redirect_to controller: 'top', action: 'index'
  end
  private
  def need_login
    redirect_to controller: 'top',
      action: 'index' unless @current_user
  end
end
