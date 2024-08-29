class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :success, :danger
  
  # gem device sign_in後のページ遷移をカスタム
  def after_sign_in_path_for(resource)
    user_path(id: current_user.id)
  end
end
