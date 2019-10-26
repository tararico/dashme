class UsersController < ApplicationController
  skip_before_action :require_login
def new
  redirect_to root_path if logged_in?
  @user = User.new
  @user.build_family
end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to(root_path, notice: 'create successful!')
  else
    render :new
  end
end

def show
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to buttons_path, notice: "#{@user.name}の情報を更新しました"
  else
    render "edit"
  end
end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, family_attributes:[:id, :name])
  end
end
