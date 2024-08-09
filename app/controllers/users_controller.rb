class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @children = current_user.children.order(id: :asc)
    @child = Child.new
  end

  def menu
    @user = User.find(params[:id])
  end
  
end
