{'homepage': ['about','portfolio'], 'about-us': ['intro']}.each do |page, sections|
  sections.each do |section|
    Content.create(page: page.to_s, section: section)
  end
end

{'nav': ['favicon','logo']}.each do |page, sections|
  sections.each do |section|
    Image.create(page: page.to_s, section: section)
  end
end


# create translations with data from locale ymls
src = YAML::load_file("#{Rails.root}/config/locales/zh-TW.yml").dig('zh-TW', 'frontend')
src.each do |k1, v1|
  v1.each do |k2, v2|
    Translation.create(key: "frontend.#{k1}.#{k2}", tw: v2)
  end
end
# en not working
{'zh-CN': 'cn', 'en': 'en'}.each do |file_name, lang|
  src = YAML::load_file("#{Rails.root}/config/locales/#{file_name}.yml").dig(file_name.to_s, 'frontend')
  src.each do |k1, v1|
    v1.each do |k2, v2|
      Translation.where(key: "frontend.#{k1}.#{k2}").first.update("#{lang}": v2)
    end
  end
end