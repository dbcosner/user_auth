class SessionsController < ApplicationController

  before_filter :authenticate_user, only: [:home, :profile, :setting]

  # Prevent the user from accessing login if already logged in :
  before_filter :save_login_state, only: [:login, :login_attempt]

  def login
    # Login form
  end

  def logout
    session[:user_id] = nil
    redirect_to(action: 'login')
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "Welcome back, #{authorized_user.username}."
      redirect_to(action: :home)
    else
      flash[:notice] = 'Invalid username or password'
      flash[:color] = 'invalid'
      render 'login'
    end
  end

  def home
  end

  def profile
  end

  def setting
  end

end
