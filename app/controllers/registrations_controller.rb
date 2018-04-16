class RegistrationsController < Devise::RegistrationsController

  before_action :two_user_registered?, only: [:new, :create]
  
  protected

  def two_user_registered?
    if ((AdminUser.count == 2) & (admin_user_signed_in?))
      redirect_to root_path
    elsif AdminUser.count == 2
      redirect_to new_admin_user_session_path
    end  
  end

  def after_update_path_for(resource)
    admin_root_path
  end

end