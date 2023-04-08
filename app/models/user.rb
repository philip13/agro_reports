class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :invitable

  has_one :account, foreign_key: "owner_id", inverse_of: :owner
  accepts_nested_attributes_for :account
  has_many :collaborators, class_name: "User", foreign_key: "invited_by_id"
end
