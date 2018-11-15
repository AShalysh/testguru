class SessionsController < ApplicationController

  skip_before_action :store_page

  #to show the form for login
  def new
  end
#creating sessions
  def create
    user = User.find_by(email: params[:email]) #searching user by email

    if user&.authenticate(params[:password]) #if user is nil, it will be also nil. If user is found, we will have object. Whatever is in the hash will be checked with password in password_digest
      session[:user_id] = user.id #the method session is like hash
      if cookies[:last_page]
        redirect_to cookies[:last_page]
      else  
        redirect_to tests_path
      end  
    else
      flash_message_verify_login
      #flash.now[:alert] = 'Are you a GURU. Verify your your email and password please.' #if something went wrong, we give a flash message
      render :new
    end
      
  end
#logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
