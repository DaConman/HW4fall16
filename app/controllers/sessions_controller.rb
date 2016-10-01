class SessionsController < ApplicationController
  def session_params
    params.require(:login).permit(:user_id, :email)
  end
  
  def new
    
  end
  
  def create
    @user = User.find_by(user_id: session_params[:user_id], email: session_params[:email])
    if(@user.nil?)
       flash[:notice] = "Sorry that user-id/email doesn't exist. Try again"
       redirect_to login_path
    else
       flash[:notice] = "You are logged in as #{@user.user_id}"
       session[:session_token] = @user.session_token
       redirect_to movies_path
    end
  end
  
  def destroy
    reset_session
    redirect_to movies_path
  end

end