module AdminHelper
  
  def admin_index_image instance
    image_tag instance.image.src if instance.image.present?
  end

  def vimeo_url src
    "https://vimeo.com/#{src}"
  end
    
  def admin_session
    if admin_user_signed_in?
      link_to 'Logout', destroy_admin_user_session_path, method: :delete, class: "btn btn-default btn-flat form-control"
    else
      link_to 'Login', new_admin_user_session_path, class: "btn btn-default btn-flat form-control"
    end
  end
  
end