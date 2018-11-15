module SessionsHelper
  #if something went wrong, we give a flash message
  def flash_message_verify_login
    flash.now[:alert] = 'Are you a GURU. Verify your your email and password please.'
  end
end
