class Room < ApplicationRecord
  
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :charge, presence: true
  validates :address, presence: true
  validates :room_image, presence: true
  
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  mount_uploader :room_image, RoomImagesUploader
  
  
end
