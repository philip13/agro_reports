class AccountPolicy
  attr_reader :user, :account

  def initialize(user, account)
    raise Pundit::NotAuthorizedError, "must be a collaborator" unless user
    @user = user
    @account = account
    @my_account = @user.account
  end

  def show?
    @my_account == @account || @my_account.get_accounts.include?(@account)
  end

  def update?
    @my_account == @account
  end
end

