class ChildrenController < ApplicationController
  
  def index
    @is_user_children = request.path == user_children_path(current_user)
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
    @child = current_user.children.find(params[:id])
  end

  def edit
    @child = current_user.children.find(params[:id])
  end

  def update
    @child = current_user.children.find(params[:id])
    
    if @child.update(child_params)
      redirect_to user_children_path(current_user), success: "成功したよ"
    else
      puts @child.errors.full_messages
      flash.now[:danger] = "失敗したよ"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @child = current_user.children.find(params[:id])
    @child.destroy
    redirect_to user_children_path(current_user), status: :see_other, success: t('.success')
  end

  private

  def child_params
    params.require(:child).permit(:name).merge(user_id: current_user.id)
  end
end
