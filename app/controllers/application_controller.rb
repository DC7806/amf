class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale, :default_url_options

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


end
