class Portfolio < ApplicationRecord

  # association
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  # callbacks
  before_save :default_values

  # translation
  extend Mobility
  translates :title, type: :string, locale_accessors: [:en, :"zh-TW", :"zh-CN"]
  translates :description, type: :text, locale_accessors: [:en, :"zh-TW", :"zh-CN"]

  # sortable
  include AdminSortable

  private

  def default_values
    self.image.alt_en = title_en.downcase
    self.image.alt_zh_tw = title_zh_tw.downcase
    self.image.alt_zh_cn = title_zh_cn.downcase
  end

end
