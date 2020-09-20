class ApplicationController < ActionController::Base
  before_action :load_user
  private
  def load_user
    @current_user = nil
    if session[:user_id]
      begin
        @current_user = User.find(session[:user_id])
      rescue
      end
    end
  end
end
