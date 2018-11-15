class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #with this helper our current_user will be available in views
  helper_method :current_user, :logged_in?

  before_action :store_page

  private
#to check if the user was logged in or not
#to get a user from DB
  def authenticate_user!
    unless current_user
      return redirect_to login_path, alert: 'Are you a GURU. Verify your your email and password please.' #if user didn't login, but trying to get the list of tests
    end
    #we set new cookie, that is not on http
    cookies[:email] = current_user.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  #to check if our current_user exists
  def logged_in?
    current_user.present?
  end

  def store_page
    cookies[:last_page] = request.path
  end

end
