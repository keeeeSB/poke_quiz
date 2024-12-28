class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  def require_login
    unless logged_in?
      flash[:warning] = "ログインしてください。"
      redirect_to login_path
    end
  end
end
