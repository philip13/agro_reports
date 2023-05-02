module PunditAuthorization
  extend ActiveSupport::Concern
  include Pundit::Authorization

  included do
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  protected
    def user_not_authorized
      flash[:alert] = I18n.t("no_authorized")
      redirect_back(fallback_location: root_path)
    end
end
