class SessionsController < ApplicationController

  def new
    @user = User.new
    redirect_to root_path if current_user
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    end
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
