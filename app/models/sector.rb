class Sector < ApplicationRecord
  belongs_to :client
  has_one :crop
  validates :name, :phenological_state, presence: true

end
