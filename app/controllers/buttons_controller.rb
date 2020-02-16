class ButtonsController < ApplicationController
  before_action :set_button, only: [:show, :edit, :update, :destroy]

  # GET /buttons
  # GET /buttons.json
  def index
    @buttons = Button.where(family_id: @current_user.family_id)
  end


  # GET /buttons/new
  def new
    @button = Button.new
  end

  # GET /buttons/1/edit
  def edit
  end

  # POST /buttons
  # POST /buttons.json
  def create
    @button = Button.new(button_params)
    @button.family_id = @current_user.family_id

    respond_to do |format|
    if params[:commit] == "登録する"
      if @button.save
        format.html { redirect_to buttons_path, notice: 'ボタンを作成しました' }
      else
        format.html { render :new }
      end
    else params[:create_item] == "ボタンを登録 & アイテムリストに追加する"
    if create_button_with_item
      format.html { redirect_to buttons_path, notice: "#{@button.name}を買い物リストに追加しました"}
    else
      format.html { render :new }
    end
  end
    end
  end

  # PATCH/PUT /buttons/1
  # PATCH/PUT /buttons/1.json
  def update
    respond_to do |format|
      if @button.update(button_params)
        format.html { redirect_to buttons_path, notice: 'ボタンを編集しました' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /buttons/1
  # DELETE /buttons/1.json
  def destroy
    @button.destroy
    respond_to do |format|
      format.html { redirect_to buttons_url, notice: 'ボタンを削除しました' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_button
      @button = Button.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def button_params
      params.require(:button).permit(:name, :avatar)
    end

    def create_button_with_item
      @button.save
      @item = Item.new(button_id: @button.id)
      @item = @button.items.new
      @item.save
      notify_to_slack(@item)
      true
    end

    def notify_to_slack(item)
      workspace = current_user.family.slack_workspace
      return unless workspace
      workspace.notify(item.button.name, items_url)
    end
end
