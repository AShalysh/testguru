module SessionsHelper
  #if something went wrong, we give a flash message
  def print_flash_message(key)
    content_tag :p, flash[key] if key
  end
end
