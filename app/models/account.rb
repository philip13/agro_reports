class Account < ApplicationRecord
  belongs_to :owner, class_name: "User", inverse_of: :account

  validates :name, presence: true
  validates :name, uniqueness: true

  def short_name
    name.truncate(15, separator: " ")
  end
end
