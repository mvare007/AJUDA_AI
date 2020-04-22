class Volunteer < ApplicationRecord
  attr_accessor :volunteer_id

  belongs_to :request
  has_many :assignments
end
