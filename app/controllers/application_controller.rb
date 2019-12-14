class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_hamburger_menu
  protect_from_forgery with: :exception

  private
    def not_authenticated
      redirect_to login_path
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_family
      @current_family ||= current_user.family
    end

    def family_members
      current_family.users.where.not(id: current_user.id)
    end

    def set_hamburger_menu
      @hamburger_menu = !!@current_user
    end
end
