class Assignment < ApplicationRecord
  belongs_to :request
  belongs_to :asker, class_name: "User"
  belongs_to :volunteer, optional: true

  validates :asker_id, presence: true
  validates :request_id, presence: true
  validates :volunteer_id, presence: false
end
