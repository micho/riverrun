# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def location_name
    "#{params[:action]}_#{params[:controller]}"
  end

end
