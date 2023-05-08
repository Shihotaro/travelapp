class User < ApplicationRecord
  has_secure_password

  has_many :reservations
  has_many :rooms

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :icon_image, IconUploader
end
