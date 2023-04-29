class Account < ApplicationRecord
  belongs_to :owner, class_name: "User", inverse_of: :account

  validates :name, presence: true
  validates :name, uniqueness: true

  def get_accounts 
    Account.where("id IN (?)", [id, owner.invited_by.account.id])
  end
end
