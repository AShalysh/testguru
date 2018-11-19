class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  #to show the form for login
  def new
  end
  #creating sessions
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password]) #if user is nil, it will be also nil. If user is found, we will have object. Whatever is in the hash will be checked with password in password_digest
      session[:user_id] = user.id #the method session is like hash
      redirect_to cookies.delete(:last_page) || tests_path 
    else
      flash.now[:alert] = 'Are you a GURU. Verify your email and password please.'
      render :new
    end
  end
  #logout
  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
