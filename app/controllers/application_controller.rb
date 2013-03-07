class ApplicationController < ActionController::Base
  protect_from_forgery

  #def authenticate_active_admin_user!
  #  authenticate_user!
  #  unless current_user.superadmin?
  #    flash[:alert] = "Unauthorized Access!"
  #    redirect_to root_path
  #  end
  #end
  #rescue_from CanCan::AccessDenied do |exception|
  #  redirect_to root_url, :alert => exception.message
  #end
  #
  #def current_ability
  #  @current_ability ||= Ability.new(current_user)
  #end
end

