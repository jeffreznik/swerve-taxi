class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def current_user
      @_current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end

    def protected_action
      if current_user == nil
        redirect_to login_path
      end
    end
end
