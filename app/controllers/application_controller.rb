class ApplicationController < ActionController::Base
  include SetupDeviseBehavior
  include PunditAuthorization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :setup_credentials, if: :user_signed_in?

  private
    def record_not_found
      redirect_back_or_to root_path, alert: I18n.t("record_no_found")
    end

    def setup_credentials
      Current.user = current_user
      Current.account = Account.find(params[:account_id]) unless params[:account_id].nil?
    end
end
