class Report < ApplicationRecord
  belongs_to :account
  belongs_to :client
  belongs_to :sector
end
