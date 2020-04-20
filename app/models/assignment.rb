class Assignment < ApplicationRecord
  belongs_to :request
  belongs_to :asker, class_name: "User"
  has_one :volunteer

  validates :asker_id, presence: true
end
