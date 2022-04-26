# frozen_string_literal: true

class UsersController < BaseController
  layout 'user', only: %i[sign_up sign_in]

  def default_resume
    @user = User.find_by!(username: params[:user_id])
    @resume = @user.default_resume
  end

  def sign_up
    @user = User.new
  end

  def sign_in; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to sign_in_users_path, notice: '會員註冊成功'
    else
      render :sign_up, layout: 'user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :username, :password, :password_confirmation)
  end
end
