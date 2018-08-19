class ItemsController < ApplicationController
  def index
    @items = Item.all

    return unless params[:geo_location_id] && params[:distance]
    @items = @items.near(GeoLocation.find(params[:geo_location_id]), params[:distance])
  end
end
