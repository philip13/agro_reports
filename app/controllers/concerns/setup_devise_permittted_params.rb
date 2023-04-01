module SetupDevisePermitttedParams
  extend ActiveSupport::Concern

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :name, account_attributes: [:name]
      ])
    end
end