module AdminHelper
  
  def admin_index_image instance
    image_tag instance.image.src if instance.image.present?
  end

  def vimeo_url src
    "https://vimeo.com/#{src}"
  end
    
end