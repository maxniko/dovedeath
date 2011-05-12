class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_admin
    # logger.debug "ApplicationController::require_user"

     if !current_usuario.try(:admin?) # comprobación del rol
       #store_location
       flash[:notice] = I18n.translate("application_controller.require_user")
       redirect_to posts_url
       return false

     end
   end

end

