class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id if current_user
    if @listing.save
      redirect_to user_listing_path(current_user, @listing)
    else
      redirect_to new_user_listing_path(current_user, @listing)
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:condition, :price, :user_id, :album_id)
  end

end
