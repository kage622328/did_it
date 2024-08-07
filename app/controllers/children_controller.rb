class ChildrenController < ApplicationController

  def create
    @child = current_user.children.build(child_params)

    if @child.save
      redirect_to user_path(current_user), success: t('defaults.flash_message.created', item: Child.model_name.human)
    else
      redirect_to user_path(current_user), flash: { error: @child.errors.full_messages.join(", ") }
    end
  end

  def destroy
    @child = current_user.children.find(params[:id])
    @child.destroy
    redirect_to user_path(current_user), status: :see_other, success: t('.success')
  end

  private

  def child_params
    params.require(:child).permit(:name).merge(user_id: current_user.id)
  end
end
