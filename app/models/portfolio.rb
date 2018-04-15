class Portfolio < ApplicationRecord

  # association
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  # translation
  extend Mobility
  translates :title, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  translates :description, type: :text, locale_accessors: [:en, :"zh-TW", :"zh-CN"]

  # sortable
  include RailsSortable::Model
  set_sortable :sort, without_updating_timestamps: true

end
