class Review < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :content, length: { maximum: 300 }
end
