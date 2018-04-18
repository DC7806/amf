class Image < ApplicationRecord
  
  # association
  belongs_to :imageable, polymorphic: true, optional: true

  # carrierwave
  mount_uploader :src, ImageUploader

  extend Mobility
  translates :alt, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  
end
