class Volunteer < ApplicationRecord
  belongs_to :request
  has_many :assignments
end
