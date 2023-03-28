class Account < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  validates :name, presence: true
  validates :name, uniqueness: true

end
