class Review < ApplicationRecord
  belongs_to :user
  belongs_to :request_user
end
