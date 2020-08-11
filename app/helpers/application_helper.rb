module ApplicationHelper
  def options_for_geo_location_select
    options_for_select(
      GeoLocation.all.map { |gl| [gl.label, gl.id] },
      params[:geo_location_id]
    )
  end
end
