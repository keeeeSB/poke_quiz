class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        reset_session
        log_in user
        flash[:success] = "ログインしました！"
        redirect_to user
      else
        flash[:danger] = "アカウントが承認されていません。メールを確認してください。"
        redirect_to root_path
      end
    else
      flash.now[:danger] = "メールアドレス、又はパスワードが間違っています。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました。"
    redirect_to root_path, status: :see_other
  end
end
