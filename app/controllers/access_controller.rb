class AccessController < ApplicationController

  layout 'admin'

  #whitelist approach vs black with except vs only
  before_action :confirmed_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    @username = session[:username]
  end

  def login
    # display a login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    else
      # flash.now for current request vs next as with redirect_to
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end


end
