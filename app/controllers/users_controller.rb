class UsersController < ApplicationController

  def new
    @user = User.new
    redirect_to current_user if current_user
  end

  def create
    @user = User.new(user_params)
     if @user.save
       session[:user_id] = @user.id
       redirect_to @user
     else
       redirect_to root_path
     end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
