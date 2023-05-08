class Reservation < ApplicationRecord
  belongs_to :rooms, class_name: 'Room'
  belongs_to :users, class_name: 'User'

  validates :checkin, presence: true
  validates :checkout, presence: true, comparison: { greater_than: :checkin }
  validates :party, presence: true

end
