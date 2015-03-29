class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username], password: params[:session][:password])
    if user
      reset_session
      session[:user_id] = user.id
      redirect_to profile_path
    else
      flash[:danger] = "Invalid user/password combination #{params[:session][:username]} #{params[:session][:password]}"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
