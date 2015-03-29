class UsersController < ApplicationController
  def show
    protected_action

    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
    else
      @user = current_user
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :login
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end