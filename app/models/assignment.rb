class Assignment < ApplicationRecord
  belongs_to :request
  belongs_to :asker, class_name: "User"

  validates :asker_id, presence: true
end
