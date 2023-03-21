class Client < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates :email, presence: true, email: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
