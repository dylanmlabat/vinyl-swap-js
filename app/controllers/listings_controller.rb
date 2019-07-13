class ListingsController < ApplicationController
  include ListingsHelper
  before_action :require_permission, only: [:edit]

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

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to user_listing_path(current_user, @listing)
    else
      redirect_to edit_user_listing_path(current_user, @listing)
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
