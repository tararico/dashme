class FamilyInvitationsController < ApplicationController
  skip_before_action :require_login, only: [:edit, :update], raise: false

  def edit
    @user = User.new
    @invitation = Invitation.find(params[:id])
    if !@invitation.authenticated?(params[:token]) || @invitation.sign_up? || @invitation.expired?
      flash[:notice] = "無効なリンクです。"
      redirect_to root_url
    end
  end

  def update
    user = User.authenticate(params[:email], params[:password])
    if user
      user.join_new_family(params[:invitation_id])
      flash[:notice] = "新しいファミリーに参加しました！"
      redirect_to root_url
    else
      render :edit
    end
  end
end
