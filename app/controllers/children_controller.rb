class ChildrenController < ApplicationController
  require "date"
  before_action :set_child, only: %i[show edit update destroy update_list_and_coin]
  
  def index
    @children = current_user.children.order(id: :asc)
  end
  
  def create
    @child = current_user.children.build(child_params)

    if @child.save
      @coin = Coin.new(child_id: @child.id)

      if @coin.save
        redirect_to user_path(current_user), success: t('defaults.flash_message.created', item: Child.model_name.human)
      else
        @child.destroy
        redirect_to user_path(current_user), flash: { error: @child.errors.full_messages.join(", ") }
      end
    else
      redirect_to user_path(current_user), flash: { error: @child.errors.full_messages.join(", ") }
    end
  end

  def show
    @lists = @child.lists.created_at_today.order(id: :asc)
  end

  def edit; end

  def update
    if @child.update(child_params)
      redirect_to children_path, status: :see_other, success: t(".update_child_name")
    else
      flash.now[:danger] = t(".not_update_child_name")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, status: :see_other, success: t('.success')
  end

  def update_list_and_coin
    @list = @child.lists.find_by(id: params[:list_id])
    @coin = Coin.find_by(child_id: @child.id)

    if @coin
      @coin.coin_amount += 1
      @coin.save
    else
      redirect_to child_path(@child), danger: t('not_find_coin') and return
    end

    if @list && @list.incomplete?
      @list.completed!
      @list.save
    else
      redirect_to child_path(@child), danger: t('not_find_list') and return
    end

    render json: { status: 'success', redirect_url: child_path(@child), message: t('.get_coin') }
    #redirect_to child_path(@child), success: 'コインをゲットしたよ'
  end

  private

  def set_child
    @child = current_user.children.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name).merge(user_id: current_user.id)
  end
end
