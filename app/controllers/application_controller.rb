class ApplicationController < ActionController::Base
	before_action :set_slug_name

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
  	if current_user.has_role? :admin
  		admin_path
  	else
  		root_path
  	end
	end
  
  def after_sign_out_path_for(resource_or_scope)
	  root_path
	end
	
	private 
		def set_slug_name
			@slug = current_user.profile.slug if current_user
		end
end
