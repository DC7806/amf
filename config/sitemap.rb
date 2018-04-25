# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = Figaro.env.domain
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create_index = false

SitemapGenerator::Sitemap.create do
  I18n.available_locales.each do |locale|
    group(filename: "sitemap-"+locale.to_s) do

      add root_path(locale: locale), lastmod: 1.day.ago, priority: 1, changefreq: 'daily'

      ['portfolios','about-us'].each do |page|
        add "#{locale.to_s}/#{page}", lastmod: 1.week.ago, priority: 0.9, changefreq: 'weekly'
      end

    end
  end
end
