class Assignment < ApplicationRecord
  belongs_to :request
  belongs_to :receiver, class_name: "User"
  belongs_to :asker, class_name: "User"
end
