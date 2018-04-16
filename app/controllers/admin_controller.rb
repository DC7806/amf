class AdminController < ApplicationController
  
  #devise
  before_action :authenticate_admin_user!

  #overwrite default_url_options
  include DeviseAdminLocale
  
end