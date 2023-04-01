class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one :account, foreign_key: "owner_id", inverse_of: :owner
  accepts_nested_attributes_for :account

  def with_account
    build_account if account.nil?
    self
  end
end
