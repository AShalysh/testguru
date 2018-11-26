class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end
  
  # before_action :authenticate_user! #checking if user was auth

  #with this helper our current_user will be available in views
  #helper_method :current_user, :logged_in?

  # private
  # #to check if the user was logged in or not; to get a user from DB
  # def authenticate_user!
  #   unless current_user
  #     cookies[:last_page] = request.path
  #     redirect_to login_path, alert: 'Are you a GURU. Verify your your email and password please.'
  #   end
  # end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def logged_in?
  #   current_user.present?
  # end

end
