class Account < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", inverse_of: :account, optional: -> { new_record? }
  validates :name, presence: true
  validates :name, uniqueness: true
end
