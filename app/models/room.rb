class Room < ApplicationRecord
  
  belongs_to :user
  has_many :reservations
  
  mount_uploader :room_image, RoomImagesUploader
  
end
