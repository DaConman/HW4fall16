class UsersController < ApplicationController

  def movie_params
    params.require(:movie).permit(:user_id, :email)
  end
  
  def new
    @user = User.new
    # default: render 'new' template
  end 
  
  def create
    @user = User.create!(user_params)
    flash[:notice] = "#{@user.user_id} was successfully created."
    redirect_to root_path
  end
  
  

end