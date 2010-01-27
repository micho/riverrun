# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :login_required, :set_locale

  filter_parameter_logging :password
  
  private
  
  def permission_denied(message = nil)
    flash[:error] = message || "You don't have permission to do that"
    redirect_to '/'
  end
  
  def not_found
    render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
  end
  
  def set_locale
    if browser_locale = request.headers['HTTP_ACCEPT_LANGUAGE']
      preferred_locale = ['en', 'es'].select { |i| browser_locale.include? i }.collect { |i| [i, browser_locale.index(i)] }.sort { |a,b| a[1] <=> b[1] }.first

      I18n.locale = preferred_locale.try(:first) || 'en'
    else
      I18n.locale = 'en'
    end
  end
end
