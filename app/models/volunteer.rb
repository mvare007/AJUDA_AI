class Volunteer < ApplicationRecord
  belongs_to :assignment
  belongs_to :request
end
