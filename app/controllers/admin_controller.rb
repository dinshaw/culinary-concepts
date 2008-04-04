class AdminController < ApplicationController  
  include ListMethods
  layout "admin"
  before_filter :login_required
end