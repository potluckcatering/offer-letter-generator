class Users::InvitationsController < Devise::InvitationsController
  before_action :update_sanitized_params, only: :update

  after_action :update_first_name, :only => [:create]
  after_action :update_last_name, :only => [:create]

  def after_accept_path_for(resource)
    edit_user_registration_path
  end

  def update
    respond_to do |format|
      format.js do
        invitation_token = Devise.token_generator.digest(resource_class, :invitation_token, update_resource_params[:invitation_token])
        self.resource = resource_class.where(invitation_token: invitation_token).first
        resource.skip_password = true
        resource.update_attributes update_resource_params.except(:invitation_token)
      end
      format.html do
        super
      end
    end
  end

  protected

  def update_first_name
    @user = User.find_by_email(params[:user][:email])
    @user.update_attribute :first_name, params[:first_name]
  end

  def update_last_name
    @user = User.find_by_email(params[:user][:email])
    @user.update_attribute :last_name, params[:last_name]
  end

  def update_sanitized_params
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:password, :first_name, :last_name, :password_confirmation, :invitation_token, :email])
  end

end