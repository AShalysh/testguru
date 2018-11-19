module SessionsHelper
  #if something went wrong, we give a flash message
  def print_flash_message(key, options)
    if key
      content_tag :p, flash[key], options
    end
  end
end
