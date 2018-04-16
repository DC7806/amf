{'homepage': ['about','portfolio'], 'about-us': ['intro']}.each do |page, sections|
  sections.each do |section|
    Content.create(page: page.to_s, section: section)
  end
end