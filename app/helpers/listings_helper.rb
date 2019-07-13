module ListingsHelper

  def require_permission
    @listing = Listing.find(params[:id])
    if current_user != @listing.user
      redirect_to user_listing_path(@listing.user, @listing)
    end
  end

end
