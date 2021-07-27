class News < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, ImagesUploader
end
