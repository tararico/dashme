class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false

  def new
      @user = User.new
  end

  def create
      if @user = login(params[:email], params[:password])
          redirect_back_or_to(root_path, notice: 'login successful!')
      else
        render :new
      end
  end

  def destroy
      logout
      redirect_to(login_path, notice: 'log out!')
  end
end
