class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def banned?
    if current_user.present? && current_user.role.name == 'banned'
      sign_out current_user
      flash[:alert] = "The account associated with this email has been suspended."
      redirect_to new_user_session_path
    end
  end
  
end
