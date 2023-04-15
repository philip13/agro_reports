class ApplicationController < ActionController::Base
  include SetupDeviseBehavior

  before_action :authenticate_user!
end
