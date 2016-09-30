class UsersController < ApplicationController

  def movie_params
    params.require(:movie).permit(:user_id, :email, :session_token)
  end
  
  def createuser
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to new_user_path
  end
  
  

end