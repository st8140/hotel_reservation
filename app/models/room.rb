class Room < ApplicationRecord
  
  mount_uploader :room_image, RoomImagesUploader
  
end
