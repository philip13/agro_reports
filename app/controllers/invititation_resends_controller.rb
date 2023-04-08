class InvititationResendsController < ApplicationController
  def create
    collaborator = User.find(params[:id])

    if collaborator.created_by_invite? && !collaborator.invitation_accepted?
      collaborator.invite!
      redirect_to collaborators_path, notice: I18n.t("devise.invitations.send_instructions", email: collaborator.email)
    else
      redirect_to collaborators_path, alert: I18n.t("deise.invitations.no_invitations_remaining")
    end
  end
end
