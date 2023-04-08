module SetupDevisePermitttedParams
  extend ActiveSupport::Concern
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, account_attributes: [:name]])
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, account_attributes: [:name]])
      devise_parameter_sanitizer.permit(:invite, keys: [:name])
    end
end
