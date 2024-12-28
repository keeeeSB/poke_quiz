class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      reset_session
      log_in user
      flash[:success] = "アカウントを承認しました。"
      redirect_to user
    else
      flash[:danger] = "無効なリンクです。"
      redirect_to root_path
    end
  end
end
