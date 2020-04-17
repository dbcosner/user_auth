class SessionsController < ApplicationController
  def login
    # Login form
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      flash[:notice] = "Welcome back, #{authorized_user.username}."
      redirect_to(action: :home)
    else
      flash[:notice] = 'Invalid username or password'
      flash[:color] = 'invalid'
      render 'login'
    end
  end

  # def home
  # end
  #
  # def profile
  # end
  #
  # def setting
  # end
end
