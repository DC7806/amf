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

end
