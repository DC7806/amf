class Image < ApplicationRecord
  
  # association
  belongs_to :imageable, polymorphic: true, optional: true

  # carrierwave
  mount_uploader :src, ImageUploader

end
