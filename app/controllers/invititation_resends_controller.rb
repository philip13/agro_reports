class InvititationResendsController < ApplicationController
  def create
    collaborator = User.find(params[:id])

    if collaborator.created_by_invite? && !collaborator.invitation_accepted?
      collaborator.invite!
      redirect_to account_collaborators_path(Current.account), notice: I18n.t("devise.invitations.send_instructions", email: collaborator.email)
    else
      redirect_to account_collaborators_path(Current.account), alert: I18n.t("deise.invitations.no_invitations_remaining")
    end
  end
end
