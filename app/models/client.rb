class Client < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates :email, presence: true, email: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
