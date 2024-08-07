class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :danger
  
  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end
end
