class StaticPagesController < ApplicationController

  def home
    @listings = Listing.all
    @recent_listings = @listings.reverse[0..4]
  end

end
