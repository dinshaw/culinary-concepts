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
end
