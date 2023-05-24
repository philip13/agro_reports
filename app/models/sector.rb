class Sector < ApplicationRecord
  belongs_to :client
  belongs_to :crop
end
