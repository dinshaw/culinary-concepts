class PublicController < ApplicationController
  skip_before_filter :login_required

  def index
    redirect_to :action => :home
  end

  def home
    find_page("Home")
  end
  
  def about_us
    find_page("About Us")
  end

  def contact_us
    find_page("Contact Us") 
  end

  def jean_georges
    find_page("Jean-Georges") 
  end

  def careers
    find_page("Careers") 
  end

  def gift_cards
    find_page("Gift Cards") 
  end
  
  private
  def find_page(title)
      @page = Page.find_by_title(title) || Page.new
  end
end
