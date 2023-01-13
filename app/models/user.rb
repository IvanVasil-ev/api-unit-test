# frozen_string_literal: true

class User < ApplicationRecord
  has_many :news
  mount_uploader :avatar, ImagesUploader

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  def self.create_user_for_google(data)
    where(uid: data['email']).first_or_initialize.tap do |user|
      user.provider = 'google_oauth2'
      user.uid = data['email']
      user.email = data['email']
      user.name = data['name']
      user.password = Devise.friendly_token[0, 20]
      user.password_confirmation = user.password
      user.save!
    end
  end
end
