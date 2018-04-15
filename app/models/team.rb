class Team < ApplicationRecord
  
  # association
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  # translation
  extend Mobility
  translates :name, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  translates :description, type: :text, locale_accessors: [:en, :"zh-TW", :"zh-CN"]

  # sortable
  include AdminSortable

end
