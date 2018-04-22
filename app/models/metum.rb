class Metum < ApplicationRecord

  # association
  belongs_to :metumble, polymorphic: true, optional: true

  mount_uploader :og_image, ImageUploader

  # translation
  extend Mobility
  translates :title, :og_title, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  translates :description, :og_description, type: :text, locale_accessors: [:en, :"zh-TW", :"zh-CN"]

  def self.find_page page
    where(page: page).first
  end

end
