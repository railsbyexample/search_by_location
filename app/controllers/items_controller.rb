class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(store: [:geo_location, :seller])

    return if params[:geo_location_id].blank? || params[:distance].blank?
    @items = @items.near(GeoLocation.find(params[:geo_location_id]), params[:distance])
  end
end
