class PasswordResetsController < ApplicationController
  before_action :require_not_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.deliver_reset_password_instructions!
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.danger')
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)
    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: 'パスワードを変更しました'
    else
      flash.now[:danger] = 'パスワードを変更できませんでした'
      render :edit, status: :unprocessable_entity
    end
  end
end
