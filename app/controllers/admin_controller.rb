class AdminController < ApplicationController
  
  #devise
  before_action :authenticate_admin_user!, :find_contents
  #overwrite default_url_options
  include DeviseAdminLocale

  private

  def find_contents
    @homepage_about = Content.where(page: 'homepage').where(section: 'about').first
    @homepage_portfolio = Content.where(page: 'homepage').where(section: 'portfolio').first 
    @about_intro = Content.where(page: 'about-us').where(section: 'intro').first 
  end
  
end