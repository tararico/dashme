class SlackWorkspacesController < ApplicationController
  skip_before_action :require_login

def new
  @slack_workspace = SlackWorkspace.new
end

def create
  @slack_workspace = SlackWorkspace.new(slack_workspace_params)
  @slack_workspace.family_id = current_user.family_id
  if @slack_workspace.save
    redirect_to(root_path, notice: 'slack通知が登録されました')
  else
    render :new
  end
end

def show
end

def edit
  @slack_workspace = SlackWorkspace.find(params[:id])
end

def update
  @slack_workspace = SlackWorkspace.find(params[:id])
  if @slack_workspace.update(slack_wokplace_params)
    redirect_to buttons_path, notice: "#{@slack_workspace.room}の情報を更新しました"
  else
    render "edit"
  end
end

private

  def slack_workspace_params
    params.require(:slack_workspace).permit(:webhook_url)
  end
end
