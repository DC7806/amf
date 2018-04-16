class Content < ApplicationRecord

  # association
  belongs_to :contentable, polymorphic: true, optional: true
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  # translation
  extend Mobility
  translates :title, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  translates :description, type: :text, locale_accessors: [:en, :"zh-TW", :"zh-CN"]

end
