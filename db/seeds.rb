{'homepage': ['about','portfolio'], 'about-us': ['intro']}.each do |page, sections|
  sections.each do |section|
    Content.create(page: page.to_s, section: section)
  end
end

{'nav': ['favicon','logo'], 'homepage': ['banner']}.each do |page, sections|
  sections.each do |section|
    Image.create(page: page.to_s, section: section)
  end
end

# create translations with data from locale ymls
src_tw = YAML::load_file("#{Rails.root}/config/locales/zh-TW.yml").dig('zh-TW', 'frontend')
src_tw.each do |k1, v1|
  v1.each do |k2, v2|
    Translation.create(key: "frontend.#{k1}.#{k2}", tw: v2)
  end
end

def find_value key, locale
  chain = key.split('.')
  locale.dig(chain[0],chain[1],chain[2])
end

src_cn = YAML::load_file("#{Rails.root}/config/locales/zh-CN.yml").dig('zh-CN')
src_en = YAML::load_file("#{Rails.root}/config/locales/en.yml").dig('en')

Translation.all.each do |translation|
  Translation.where(key: translation.key).first.update_columns(cn: find_value(translation.key, src_cn), en: find_value(translation.key, src_en))
end

# page meta
['homepage', 'portfolios', 'about-us'].each do |page|
  Metum.create(page: page)
end