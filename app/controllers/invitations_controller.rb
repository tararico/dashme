class InvitationsController < ApplicationController
  skip_before_action :require_login, only: [:edit, :update], raise: false

  def create
    @invitation = current_family.invitations.create
    redirect_to @invitation
  end

  def edit
    @user = User.new
    @invitation = Invitation.find(params[:id])
    if !@invitation.authenticated?(params[:token]) || @invitation.sign_up? || @invitation.expired?
      flash[:notice] = "無効なリンクです。"
      redirect_to root_url
    end
  end

  def update
    @invitation = Invitation.find(params[:id])
    family = @invitation.family
    @user = family.users.create(user_params)

    if @user.save
      @invitation.update(sign_up: true)
      session[:user_id] = @user.id
      redirect_to buttons_url, notice: "#{@user.name}としてユーザー登録しました"
    else
      render "edit"
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
    @family = @invitation.family
    @user = current_user
    @invitation.create_digest
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
