class AdminController < ApplicationController
  
  #devise
  before_action :authenticate_admin_user!, :find_contents
  skip_before_action :site_settings
  
  #overwrite default_url_options
  include DeviseAdminLocale

  private

  def find_contents
    content = Content.where(page: ['homepage', 'about-us'])
    @homepage_about = content.select{ |item| item.page == 'homepage' && item.section == 'about'}.first
    @homepage_portfolio = content.select{ |item| item.page == 'homepage' && item.section == 'portfolio'}.first
    @about_intro = content.select{ |item| item.page == 'about-us' && item.section == 'intro'}.first
    @homepage_banner = Image.where(page: 'homepage', section: 'banner').first
    @site_name = YAML::load_file("#{Rails.root}/yamls/system.yml").fetch('zh_tw').values.first
  end
  
end