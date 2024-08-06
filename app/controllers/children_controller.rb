class ChildrenController < ApplicationController

  def create
    @user = current_user
    @child = current_user.children.build(child_params)
    @child.save
  end

  def destroy
    @child = current_user.children.find(params[:id])
    @child.destroy
    redirect_to user_path((current_user))
  end

  private

  def child_params
    params.require(:child).permit(:name).merge(user_id: current_user.id)
  end

end
