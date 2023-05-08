class Room < ApplicationRecord
  belongs_to :user, class_name: 'User'
  
  has_many :reservations
  validates :roomname, presence: true
  validates :roomdetails, presence: true
  validates :roomrate, presence: true
  validates :roomaddress, presence: true

  mount_uploader :room_image, ImageUploader

end

