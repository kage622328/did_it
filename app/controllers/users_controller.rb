class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  
  def show
    @children = current_user.children 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
