class Portfolio < ApplicationRecord

  # translation
  extend Mobility
  translates :title, type: :string, locale_accessors: [:en, :"zh-TW"]
  translates :description, type: :text, locale_accessors: [:en, :"zh-TW"]
  
end
