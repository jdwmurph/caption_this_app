class SessionsController < ApplicationController

  def new
    #goes to login form
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to log_in_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path
  end

end
