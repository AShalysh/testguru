class MyDevise::SessionsController < Devise::SessionsController

  def create
    super
    set_flash_message :info, :my_signed_in, name: current_user.first_name
  end
end
#set_flash_message :notice, :signed_in, name: current_user.first_name if is_navigational_format?
