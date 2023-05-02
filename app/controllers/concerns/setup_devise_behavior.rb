module SetupDeviseBehavior
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, account_attributes: [:name]])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, account_attributes: [:name]])
      devise_parameter_sanitizer.permit(:invite, keys: [:name])
    end

    def after_invite_path_for(inviter, invitee)
      account_collaborators_url(Current.account)
    end

    def after_sign_in_path_for(user)
      Current.user = current_user
      account_url(Current.account)
    end
end
