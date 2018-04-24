class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception
  
  before_action :set_locale, :default_url_options, :site_settings

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_locale
    if params[:locale]
      I18n.locale = normalize_locale(params[:locale])
    elsif params[:locale].blank?
      I18n.locale = extract_locale_from_accept_language_header
    end
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
 
  def extract_locale_from_accept_language_header
    lang = request.env['HTTP_ACCEPT_LANGUAGE'].split(',').first
    if lang.include?('TW')
      :"zh-TW"
    elsif lang.include?('CN')
      :"zh-CN"
    else
      :en
    end
  end

  def normalize_locale(locale)
    case locale
    when 'zh-TW'
      :"zh-TW"
    when 'zh-CN'
      :"zh-CN"  
    else
      :en
    end
  end

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def site_settings
    
    settings = YAML::load_file("#{Rails.root}/yamls/system.yml")
    case I18n.locale
    when :'zh-TW' then @site_name = settings['zh_tw']['site_name']
    when :'zh-CN' then @site_name = settings['zh_cn']['site_name']
    when :en      then @site_name = settings['en']['site_name']
    end
    @footer_site_name = settings['en']['site_name']
    
    frontend_images = Image.where(section: ['favicon', 'logo'])
    @favicon = frontend_images.select{ |img| img.section == 'favicon'}.first.src
    @logo = frontend_images.select{ |img| img.section == 'logo'}.first.src

  end

  def page_meta
    if action_name == 'index'
      @title = Metum.find_page(controller_name).title
      @meta_desc = Metum.find_page(controller_name).og_description
      @og = { site_name:   @site_name,
              type:        controller_name,
              title:       Metum.find_page(controller_name).og_title,
              url:         request.url,
              description: Metum.find_page(controller_name).og_description,
              image:       (root_url + Metum.find_page(controller_name).og_image.url if Metum.find_page(controller_name).og_image.url.present?)}
    elsif controller_name == 'pages'
      @title = Metum.find_page(action_name).title
      @meta_desc = Metum.find_page(action_name).description
      @og = { site_name:   @site_name,
              type:        action_name,
              title:       Metum.find_page(action_name).og_title,
              url:         request.url,
              description: Metum.find_page(action_name).og_description,
              image:       (root_url+Metum.find_page(action_name).og_image.url if Metum.find_page(action_name).og_image.url.present?)}
    end
  end

end
