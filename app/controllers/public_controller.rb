class PublicController < ApplicationController
  skip_before_filter :login_required

  def index
    redirect_to :action => :index
  end

  def home
    @page = Page.find_by_title("Home") 
  end
  
  def about_us
    @page = Page.find_by_title("About Us") 
  end

  def contact_us
    @page = Page.find_by_title("Contact Us") 
  end

  def jean_georges
    @page = Page.find_by_title("Jean-Georges") 
  end

  def careers
    @page = Page.find_by_title("Careers") 
  end
end
