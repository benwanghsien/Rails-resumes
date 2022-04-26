# frozen_string_literal: true

class SessionsController < BaseController
  def create
    user = User.login(params[:user])
    if user
      session[:thankyou9527] = user.id

      path = user.role == 'user' ? my_resumes_path : root_path
      redirect_to path, notice: '登入成功'
    else
      redirect_to sign_in_users_path, alert: '帳號密碼有誤'
    end
  end

  def destroy
    session[:thankyou9527] = nil
    redirect_to root_path, notice: '已登出'
  end
end
