class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, only: [:show, :edit]
  helper_method :logged_in?, :current_user
  skip_before_action :verify_authenticity_token

  def search
  end

  def result
    @artist = params[:search]
    if Album.all.group_by(&:artist).include?(@artist)
      redirect_to "/albums/by_artist/#{@artist.parameterize}"
    else
      flash[:error] = "Artist not found"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
