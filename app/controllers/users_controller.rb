class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @children = current_user.children.order(created_at: :asc)
    @child = Child.new
  end

end
