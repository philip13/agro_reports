class Current < ActiveSupport::CurrentAttributes
  attribute :account, :user

  def user=(user)
    super
    self.account = user.account
  end
end
