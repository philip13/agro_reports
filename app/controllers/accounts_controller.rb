class AccountsController < ApplicationController
  def show
    @account = params[:id] ? Account.find(params[:id]) : current_user.account
    authorize @account, :show?
    session[:current_account] = @account
  end
end
