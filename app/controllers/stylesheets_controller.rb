class StylesheetsController < ApplicationController
  caches_page :layout, :main
  skip_before_filter :login_required
  layout false
  
  def main
    respond_to do |format|
      format.css do 
        render
      end # end format.css
    end
  end

  def layout
    respond_to do |format|
      format.css do 
        render
      end # end format.css
    end
  end
end
