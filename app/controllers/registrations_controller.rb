

class RegistrationsController < Devise::RegistrationsController
  def create
    # super
    session[:omniauth] = nil unless @user.new_record?
    
      if params[:user][:avatar].blank?
        flash[:notice] = "Successfully created user."
        redirect_to @user
      else
        render :action => "crop"
      end
    
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end

  
end


