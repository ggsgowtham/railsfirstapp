class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
  	unless user.find_by(id: session[:used_id])
  		redirect_to login_erl, notice:"Your trying to access without permission"
	end
end
