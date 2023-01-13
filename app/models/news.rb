# frozen_string_literal: true

class News < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, ImagesUploader
end
