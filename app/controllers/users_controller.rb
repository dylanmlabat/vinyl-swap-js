class UsersController < ApplicationController

  def new
    @user = User.new
    redirect_to root_path if current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
