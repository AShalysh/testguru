class MyDevise::SessionsController < Devise::SessionsController
	
	def create
		set_flash_message :notice, :signed_in, user: current_user if is_navigational_format?	
		super
	end	
end