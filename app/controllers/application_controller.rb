class ApplicationController < ActionController::Base
  include SetupDevisePermitttedParams
  before_action :configure_permitted_parameters, if: :devise_controller?
end
