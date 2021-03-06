class RegistrationsController < Devise::RegistrationsController
	def create
		super
		session[:omniauth] = nil unless @user.new_record?
	end

	def update
    	if resource.update_attributes(params[resource_name])
      		set_flash_message :notice, :updated
      		# Line below required if using Devise >= 1.2.0
      		sign_in resource_name, resource, :bypass => true
      		redirect_to after_update_path_for(resource)
    	else
      		clean_up_passwords(resource)
      		render_with_scope :edit
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
