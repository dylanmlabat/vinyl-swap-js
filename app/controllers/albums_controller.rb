class AlbumsController < ApplicationController
  before_action :require_login, only: [:new, :show, :artist]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @listings = @album.listings
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @album}
    end
  end

  def artist
    @slug = params[:artist]
    Album.all.each do |album|
      if @slug == album.artist.parameterize
        @artist = album.artist
        @artist_albums = Album.all_by_artist(@artist).discog_order
      end
    end
  end

  private

  def album_params
    params.require(:album).permit(:artist, :title, :release_year, :genre)
  end

end
