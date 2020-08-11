class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(store: %i[geo_location seller])
                 .yield_self(&method(:filter_by_location))
                 .page(params[:page])
  end

  private

  def filter_by_location(scope)
    if params[:geo_location_id].blank?
      scope
    else
      scope.near(geo_location, params[:distance].presence || 2)
           .order(:distance)
    end
  end

  def geo_location
    @geo_location ||=
      params[:geo_location_id].present? &&
      GeoLocation.find(params[:geo_location_id])
  end
end
