class AlbumsController < ApplicationController

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      redirect_to new_album_path
    end
  end

  def show
    @album = Album.find(params[:id])
    @listings = @album.listings
  end

  def artist
    @slug = params[:artist]
    Album.all.each do |album|
      if @slug == album.artist.parameterize
        @artist = album.artist
        @artist_albums = Album.all_by_artist(@artist).to_a.sort_by!{ |a| [a.release_year, a.title] }
      end
    end
  end

  private

  def album_params
    params.require(:album).permit(:artist, :title, :release_year, :genre)
  end

end
