# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :login_required

  filter_parameter_logging :password
  
  private
  
  def permission_denied(message = nil)
    flash[:error] = message || "You don't have permission to do that"
    redirect_to '/'
  end
end
