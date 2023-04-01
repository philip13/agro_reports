class ApplicationController < ActionController::Base
  include SetupDevisePermitttedParams
  before_action :authenticate_user!
end
