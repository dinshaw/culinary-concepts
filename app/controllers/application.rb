# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  layout "main"
  filter_parameter_logging :password, :password_hash, :password_salt, :email
  
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e92a3fadf10b881809520e0c1898b881'
  
  def do_colors
     @off_white = "#e5e1d8"
     @masthead_red = "#600d00"
     @bg_red = "#6f1100"
     @content_red = "#510a00"
     @salmon = "#a2766c"
     @brown = "#b4683b"
     @light_red = "#CD5C5C"
     @pink = "#fdca90"
   end
   
end
