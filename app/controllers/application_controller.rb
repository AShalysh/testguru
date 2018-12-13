class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  # to keep locale the same when you go from page to page (options={})
  # def default_url_options
  #   { lang: I18n.locale }
  # end

  def default_url_options
    if I18n.locale == :ru
      { :locale => I18n.locale, lang: I18n.locale }
    else
      { :locale => nil }
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
  
end
