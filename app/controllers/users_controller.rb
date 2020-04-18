class UsersController < ApplicationController

  # Prevent the user from accessing signup if already logged in:
  before_filter :save_login_state, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.encrypt_password
    if @user.save
      flash[:notice] = "you signed up successfully"
      flash[:color] = "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
    end
    render "new"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
