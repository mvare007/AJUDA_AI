class Picture < ApplicationRecord
  belongs_to :request
  mount_uploader :photo, PhotoUploader
end
