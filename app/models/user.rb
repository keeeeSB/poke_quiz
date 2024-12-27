class User < ApplicationRecord
  mount_uploader :profile_image, ProfileImageUploader
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
