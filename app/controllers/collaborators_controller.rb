class CollaboratorsController < ApplicationController
  def index
    @collaborators = current_user.collaborators
  end
end
