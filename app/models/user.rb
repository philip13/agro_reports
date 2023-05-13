class User < ApplicationRecord
  has_one :account, foreign_key: "owner_id", inverse_of: :owner
  has_many :collaborators, class_name: "User", foreign_key: "invited_by_id"

  validates :name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :invitable

  accepts_nested_attributes_for :account

  def collaborator?
    invited_by_id?
  end

  def get_accounts
    Account.where(id: [account.id, invited_by.account.id])
  end
end
