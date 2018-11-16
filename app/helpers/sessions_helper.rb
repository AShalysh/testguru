module SessionsHelper
  #if something went wrong, we give a flash message
  def set_unauthorized_flash_message(msg, options)
    if msg
      content_tag :p, flash[:alert], options
    end
  end
end
