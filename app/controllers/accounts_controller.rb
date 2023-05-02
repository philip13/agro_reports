class AccountsController < ApplicationController
  def show
    redirect_to account_url(current_user.account) if params[:id].nil?

    @account = params[:id] ? Account.find(params[:id]) : current_user.account

    authorize @account, :show?
    Current.account = @account
  end
end
