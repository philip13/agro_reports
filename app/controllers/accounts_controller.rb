class AccountsController < ApplicationController
  def show
    @account = params[:id] ? Account.find(params[:id]) : current_user.account
    authorize @account, :show?
  end
end
