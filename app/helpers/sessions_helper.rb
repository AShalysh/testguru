module SessionsHelper
  #if something went wrong, we give a flash message
  def print_flash_message(key)
    content_tag(:p, flash[key], {class: "flash #{key.to_s}"}) if flash[key].present?
  end
end
