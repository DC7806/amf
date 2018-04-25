module ApplicationHelper

  def page_title site_name, title
    if title.present?
      content_tag :title, "#{title} | #{site_name}"
    else
      content_tag :title, site_name
    end
  end

  def meta_desc_tag desc
    tag(:meta, name: 'description', content: desc) unless desc.nil?
  end

  def og_tag hsh
    hsh.map {|key, value| tag(:meta, property: "og:#{key}" , content: value)}.inject(&:+) if hsh.present?
  end

  def nav_langs
    case I18n.locale
    when :'zh-TW'
      (link_to '繁中', '#')+
      (content_tag :ul do
        (content_tag :li do
          link_to '簡中', locale: :'zh-CN'
        end)+
        (content_tag :li do
          link_to 'ENG', locale: :en
        end)        
      end)
    when :'zh-CN'
      (link_to '簡中', '#')+
      (content_tag :ul do
        (content_tag :li do
          link_to '繁中', locale: :'zh-TW'
        end)+
        (content_tag :li do
          link_to 'ENG', locale: :en
        end)        
      end)  
    when :en
      (link_to 'ENG', '#')+
      (content_tag :ul do
        (content_tag :li do
          link_to '繁中', locale: :'zh-TW'
        end)+
        (content_tag :li do
          link_to '簡中', locale: :'zh-CN'
        end)        
      end)
    end

  end

  def contact_info info, locale
    case locale
    when :en
      (content_tag :h5, t('frontend.about-us.number'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('en')['number'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.email'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('en')['email'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.address'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('en')['address'], class: 'mb-xs-0')
    when :'zh-TW'
      (content_tag :h5, t('frontend.about-us.number'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_tw')['number'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.email'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_tw')['email'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.address'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_tw')['address'], class: 'mb-xs-0')
    when :'zh-CN'
      (content_tag :h5, t('frontend.about-us.number'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_cn')['number'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.email'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_cn')['email'], class: 'mb-xs-10')+
      (content_tag :h5, t('frontend.about-us.address'), class: 'mb-xs-5')+
      (content_tag :p, info.fetch('zh_cn')['address'], class: 'mb-xs-0')
    end
  end

end
