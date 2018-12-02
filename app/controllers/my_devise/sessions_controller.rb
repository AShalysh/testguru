class MyDevise::SessionsController < Devise::SessionsController

  def create
    set_flash_message :notice, :signed_in, name: current_user.first_name if is_navigational_format?
    # t('sessions.signed_in', name: current_user.first_name)
    super
  end
end
